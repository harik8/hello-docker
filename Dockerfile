FROM nginx:1.29.3

RUN echo "Building hello docker..."

COPY html/ /usr/share/nginx/html/
