FROM debian:stretch

RUN apt update

RUN apt install -y wget build-essential

RUN wget -qO - https://evebox.org/files/GPG-KEY-evebox | apt-key add -

RUN echo "deb http://files.evebox.org/evebox/debian stable main" | tee /etc/apt/sources.list.d/evebox.list

RUN apt update

RUN apt install evebox

CMD evebox -e $ELASTICSEARCH