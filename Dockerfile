FROM nginx:1.17.4

RUN echo "Building hello docker..."

COPY html/ /usr/share/nginx/html/
