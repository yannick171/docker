FROM httpd:2.4
RUN rm /usr/local/apache2/htdocs/index.html
COPY ./mapage.html /usr/local/apache2/htdocs/
EXPOSE 7070
CMD ["htppd","-DFOREGROUND"]
