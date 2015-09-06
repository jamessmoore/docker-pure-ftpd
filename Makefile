.PHONY: build run kill enter

build:
	sudo docker build --rm -t wheezy-pure-ftpd-demo .

run: kill
	sudo docker run -d --name ftpd_server -p 21:21 wheezy-pure-ftpd-demo

kill:
	-sudo docker kill ftpd_server
	-sudo docker rm ftpd_server

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"
