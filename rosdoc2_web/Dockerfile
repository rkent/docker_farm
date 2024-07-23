FROM nginx:1.27

# Adapted from https://github.com/FreedomBen/nginx-docker
# Enable the auto index page
RUN sed -i -e '/location.*\/.*{/a autoindex on\;' /etc/nginx/conf.d/default.conf
