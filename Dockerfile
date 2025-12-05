FROM nginx:1.23.3

RUN echo "Building hello docker..."

COPY html/ /usr/share/nginx/html/

