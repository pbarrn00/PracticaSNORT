FROM ubuntu:22.04

RUN apt upgrade

RUN apt update && apt-get install -y curl openssh-server nano net-tools iputils-ping traceroute iptables pkg-config tcpdump nmap cargo git gcc musl-dev python3-dev python3-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

RUN useradd -m -d /home/cowrie -s /bin/bash cowrie

RUN sed -i 's/^#Port 22/Port 50/' /etc/ssh/sshd_config

RUN su - cowrie && cd /home/cowrie && git clone http://github.com/cowrie/cowrie

#COPY ./requirements.txt /home/cowrie/cowrie/requirements.txt
ADD ./cowrie.cfg /home/cowrie/cowrie/etc/cowrie.cfg
ADD ./userdb.txt /home/cowrie/cowrie/etc/userdb.txt

RUN cd /home/cowrie/cowrie && virtualenv --python=python3 cowrie-env && . cowrie-env/bin/activate && pip install --upgrade pip  && pip install --upgrade -r requirements.txt

RUN chown -R cowrie:cowrie /home/cowrie

#RUN su cowrie && /home/cowrie/cowrie/bin/cowrie start       You must not run cowrie as root!

RUN mkdir /var/run/sshd

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]
