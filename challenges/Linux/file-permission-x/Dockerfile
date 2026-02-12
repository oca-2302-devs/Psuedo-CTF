FROM ubuntu:22.04

RUN apt update && apt install -y \
  sudo \
  xdg-user-dirs \
  openssh-server \
  && mkdir /var/run/sshd

RUN useradd -m -s /bin/bash kato \
  && echo "kato:password" | chpasswd

RUN sudo -u kato xdg-user-dirs-update

COPY flag.sh /home/kato/
RUN chown kato:kato /home/kato/flag.sh

COPY flag.txt /var/log/

COPY fake_flag.txt /etc/flag.txt
COPY fake_flag.txt /etc/ssl/flag.txt
COPY fake_flag.txt /etc/systemd/flag.txt
COPY fake_flag.txt /bin/flag.txt
COPY fake_flag.txt /usr/bin/flag.txt
COPY fake_flag.txt /usr/local/bin/flag.txt
COPY fake_flag.txt /sbin/flag.txt
COPY fake_flag.txt /usr/sbin/flag.txt
COPY fake_flag.txt /boot/flag.txt
COPY fake_flag.txt /root/flag.txt
COPY fake_flag.txt /home/flag.txt
COPY fake_flag.txt /home/kato/flag.txt
COPY fake_flag.txt /var/flag.txt
COPY fake_flag.txt /var/tmp/flag.txt
COPY fake_flag.txt /tmp/flag.txt
COPY fake_flag.txt /opt/flag.txt
COPY fake_flag.txt /srv/flag.txt
COPY fake_flag.txt /dev/flag.txt
COPY fake_flag.txt /dev/char/flag.txt
COPY fake_flag.txt /proc/flag.txt
COPY fake_flag.txt /sys/flag.txt
COPY fake_flag.txt /run/flag.txt
COPY fake_flag.txt /lib/flag.txt
COPY fake_flag.txt /usr/lib/flag.txt
COPY fake_flag.txt /mnt/flag.txt
COPY fake_flag.txt /media/flag.txt
COPY fake_flag.txt /var/backups/flag.txt

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
