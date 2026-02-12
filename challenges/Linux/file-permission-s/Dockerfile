FROM ubuntu:22.04

RUN apt update && apt install -y \
  sudo \
  gcc \
  xdg-user-dirs \
  openssh-server \
  && mkdir /var/run/sshd

RUN useradd -m -s /bin/bash kato \
  && echo "kato:password" | chpasswd \
  && chmod 755 /home/kato
RUN useradd -m -s /bin/bash jhsand \
  && echo "jhsand:NhXTKzrbp2ZQwDbG" | chpasswd \
  && chmod 755 /home/jhsand
RUN useradd -m -s /bin/bash kmjak \
  && echo "kmjak:NhXTKzrbp2ZQwDbG" | chpasswd \
  && chmod 755 /home/kmjak
RUN useradd -m -s /bin/bash towaos \
  && echo "towaos:NhXTKzrbp2ZQwDbG" | chpasswd \
  && chmod 755 /home/towaos

RUN sudo -u kato xdg-user-dirs-update \
  && sudo -u jhsand xdg-user-dirs-update \
  && sudo -u kmjak xdg-user-dirs-update \
  && sudo -u towaos xdg-user-dirs-update

COPY flag.txt /root/

COPY flag.c /home/kmjak/
RUN gcc /home/kmjak/flag.c -o /home/kmjak/flag \
  && chown root:root /home/kmjak/flag \
  && chmod 4755 /home/kmjak/flag

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
