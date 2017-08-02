# NGINX image for openshift

based on the official nginx image with the following modifications to be able to run on openshift:

- listens on port 8081
- directory `/var/cache/nginx` is writeable for root group
