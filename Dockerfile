FROM ubuntu:latest

ENV USER_PASSWORD="jenkins"
ENV TZ="Asia/Karachi"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install openssh-server maven git -y && \
    useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 jenkins  && \
    echo "jenkins:${USER_PASSWORD}" | chpasswd && \
    mkdir /home/jenkins-home && \
    apt-get autoremove -y && \
    service ssh start

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]
