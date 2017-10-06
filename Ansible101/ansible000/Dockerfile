FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y openssh-server python
RUN mkdir /var/run/sshd

COPY authorized_keys /root/.ssh/authorized_keys

RUN ["chmod","0600","/root/.ssh/authorized_keys"]

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
