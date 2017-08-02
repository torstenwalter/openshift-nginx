FROM nginx:stable

# support running as arbitrary user which belogs to the root group
RUN chmod ug+rwx /var/cache/nginx

# users are not allowed to listen on priviliged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8081;/' /etc/nginx/conf.d/default.conf
