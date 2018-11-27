FROM debian:stretch

USER root

WORKDIR /root

RUN apt update

RUN apt install -y wget httpie build-essential

RUN wget https://www.openinfosecfoundation.org/download/suricata-4.0.0.tar.gz

# suricata dependencies
RUN apt-get install -y libpcre3 libpcre3-dbg libpcre3-dev build-essential \
    libnet1-dev libyaml-0-2 libyaml-dev pkg-config zlib1g zlib1g-dev \
    libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libpcap-dev \
    libnss3-dev libgeoip-dev liblua5.1-dev libhiredis-dev libevent-dev \
    rustc cargo

RUN tar xzvf ./suricata-4.0.0.tar.gz

RUN cd ./suricata-4.0.0 && ./configure --prefix=/usr/ --sysconfdir=/etc --localstatedir=/var
RUN cd ./suricata-4.0.0 && make && make install-full  && ldconfig

COPY ./suricata.yaml /etc/suricata/suricata.yaml
COPY ./urls.sh /root

CMD suricata -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal