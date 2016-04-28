FROM java:openjdk-7u91-jre-alpine

ADD package.zip.enc /home

RUN apt-get update -y && \
	apt-get install openssl unzip -y && \
	apt-get clean

CMD cd /home && \
	openssl enc -d -aes-256-cbc -in package.zip.enc -out package.zip -pass pass:$UNLOCK_KEY && \
	unzip package.zip && \
	bin/oaklet