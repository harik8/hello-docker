FROM nginx:1.29

# ENV VERSION is required to determine the app's version in CI stage
ENV VERSION=latest

COPY html/ /usr/share/nginx/html/
