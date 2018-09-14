
list:
	@docker container ls -a
	@echo
	@docker images
	@echo
	@docker network ls

start-jasper:
	@docker run --rm -dit \
	 --name jasper01 --hostname jasper01 --network net \
	 -e GS64LDI=50377 -e GS_PASSWORD=swordfish -p 50377:50377 \
	 jgfoster/gs-jasper-342

debug-jasper:
	@docker run --rm -it \
	 --name jasper00 --hostname jasper00 --network net \
	 -e GS64LDI=50378 -e GS_PASSWORD=swordfish1 -p 50378:50377 \
	 -v /home/fostja/temp:/opt/gemstone/temp \
	 jgfoster/gs-jasper-342 bash

visit-jasper:
	@docker exec -it jasper00 bash

stop-jasper:
	@docker stop jasper00

add-network:
	@docker network create --driver bridge net

remove-network:
	@docker network remove net

start-apache:
	@docker run --rm -dit --name apache --hostname apache --network net \
	 -v /home/fostja/apache/htdocs:/usr/local/apache2/htdocs/:ro \
	 -v /home/fostja/apache/conf:/usr/local/apache2/conf/:ro \
	 httpd

debug-apache:
	@docker run --rm -it --name apache --hostname apache --network net \
	 -v /home/fostja/apache/htdocs:/usr/local/apache2/htdocs/:ro \
	 -v /home/fostja/apache/conf:/usr/local/apache2/conf/:ro \
	 httpd bash

stop-apache:
	@docker stop apache

start-haproxy:
	@docker run --rm -dit --name haproxy --hostname haproxy --network net \
	 -p 80:80 -p 443:443 \
	 -v /home/fostja/haproxy:/usr/local/etc/haproxy:ro \
	 -v /etc/haproxy/certs/:/etc/haproxy/certs/:ro \
	 haproxy -f /usr/local/etc/haproxy/haproxy.cfg

debug-haproxy:
	@docker run --rm -it --name haproxy --hostname haproxy --network net \
	 -p 80:80 -p 443:443 \
	 -v /home/fostja/haproxy:/usr/local/etc/haproxy:ro \
	 -v /etc/haproxy/certs/:/etc/haproxy/certs/:ro \
	 haproxy -f /usr/local/etc/haproxy/haproxy.cfg

reload-haproxy:
	@docker kill -s HUP haproxy

stop-haproxy:
	@docker stop haproxy

key-get:
	@sudo docker run -it --rm --name certbot -p 80:80 \
	 -v "/etc/letsencrypt:/etc/letsencrypt" \
	 -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
	 certbot/certbot certonly --standalone \
	 --preferred-challenges http
 
key-copy:
	@sudo mkdir -p /etc/haproxy/certs
	@sudo cat /etc/letsencrypt/live/smalltalk.cs.wallawalla.edu/fullchain.pem \
	 /etc/letsencrypt/live/smalltalk.cs.wallawalla.edu/privkey.pem \
	 | sudo tee /etc/haproxy/certs/smalltalk.cs.wallawalla.edu.pem
	@sudo chmod go-rwx /etc/haproxy/certs
