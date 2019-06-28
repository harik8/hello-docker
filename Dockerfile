FROM nginx
RUN echo "Building hello docker..."
COPY html/ /usr/share/nginx/html/
