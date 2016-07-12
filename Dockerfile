FROM	gbates/docker-wdio

WORKDIR	/webdriverio
ADD	https://github.com/twhtanghk/wdio.inhse/archive/master.tar.gz /tmp
RUN	tar --strip-components=1 -xzf /tmp/master.tar.gz && \
	rm /tmp/master.tar.gz && \
	npm install && \

ENTRYPOINT ./entrypoint.sh
