FROM registry.eorlbruder.de/archlinux
MAINTAINER  David Magnus Henriques <eorlbruder@magnus-henriques.de>

RUN pacman -Syyu --noconfirm --quiet --needed python2 python2-setuptools && \
    pacman -Sc --noconfirm

ADD assets/ /

RUN /usr/bin/easy_install-2.7 supervisor
RUN /usr/bin/easy_install-2.7 supervisor-stdout

RUN chmod +x /setup-container

CMD ["supervisord", "-n"]
