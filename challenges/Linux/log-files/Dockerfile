FROM ubuntu:22.04

RUN apt update && apt install -y \
  sudo \
  xdg-user-dirs \
  openssh-server \
  && mkdir /var/run/sshd

RUN useradd -m -s /bin/bash kato \
  && echo "kato:password" | chpasswd

RUN sudo -u kato xdg-user-dirs-update

RUN mkdir /home/kato/logs
COPY auth.log access.log syslog /home/kato/logs/
RUN chown -R kato:kato /home/kato/logs

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
