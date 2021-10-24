echo "Hello Word fom is Run step"
docker rm -vf $(docker ps -a -q)
docker run -d -p 7070:80 --name app myapp

