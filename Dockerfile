FROM httpd:2.4
RUN rm /usr/local/apache2/htdocs/index.html
COPY ./index.html /usr/local/apache2/htdocs/
EXPOSE 7070
CMD ["httpd","-DFOREGROUND"]
