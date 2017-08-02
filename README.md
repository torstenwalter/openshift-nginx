# NGINX image for openshift

based on the official nginx image with the following modifications to be able to run on openshift:

- listens on port 8081
- directories `/var/cache/nginx`, `/var/run` and `/var/log/nginx` are writeable for root group
