# NGINX image for OpenShift

based on the official nginx image with the following modifications to be able to run on openshift:

- listens on port 8081
- directories `/var/cache/nginx`, `/var/run` and `/var/log/nginx` are writeable for root group
- removes the `user` directive from /etc/nginx/nginx.conf

More details about this repository and why the modifications are necessary to run nginx on OpenShift can be found in this blog https://torstenwalter.de/openshift/nginx/2017/08/04/nginx-on-openshift.html.
