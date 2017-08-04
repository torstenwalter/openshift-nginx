#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

declare -a tags=("latest" "mainline" "stable" "mainline-alpine" "alpine" "stable-alpine")

oc project nginx

for tag in "${tags[@]}"
do
  echo "$tag"
  NAME=nginx-${tag}
  oc process -f tests/nginx-template.yml NAME=${NAME} NGINX_VERSION=${tag} |oc apply -f -
  oc rollout latest dc/${NAME}
  oc rollout status -w dc/${NAME}
  HOST=$(oc get route ${NAME} -o jsonpath='{.spec.host}')
  URL=http://${HOST}

  HTTP_CODE=$(curl -sL -w "%{http_code}\\n" $URL -o /dev/null)
  oc scale dc/${NAME} --replicas=0
  if [ "$HTTP_CODE" == "200" ]; then
    echo "$URL is ok"
  else
    echo "$URL is not ok (http status: ${HTTP_CODE})"
    exit 1
  fi
done
