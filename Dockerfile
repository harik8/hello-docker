FROM nginx:1.24

RUN echo "Building hello docker..."

COPY html/ /usr/share/nginx/html/
