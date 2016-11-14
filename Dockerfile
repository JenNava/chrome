FROM ubuntu:14.04

ENV CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES 1024x768

COPY copyables /

ADD https://dl.google.com/linux/linux_signing_key.pub /tmp/

RUN apt-key add /tmp/linux_signing_key.pub \
	&& apt-get update \
	&& apt-get install -y \
	google-chrome-stable \
	fonts-takao \
	pulseaudio \
	supervisor \
	x11vnc \
	&& apt-get clean \
	&& rm -rf /var/cache/* /var/log/apt/* /tmp/* \
	&& ln -s /update /usr/local/sbin/update \
	&& ln -s /update /etc/cron.hourly/update \
	&& chown -R chrome:chrome /home/chrome/.config

VOLUME ["/home/chrome"]

EXPOSE 5900
