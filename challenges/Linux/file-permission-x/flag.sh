#!/bin/bash

FILES=(
  /etc/flag.txt
  /etc/ssl/flag.txt
  /etc/systemd/flag.txt
  /bin/flag.txt
  /usr/bin/flag.txt
  /usr/local/bin/flag.txt
  /sbin/flag.txt
  /usr/sbin/flag.txt
  /boot/flag.txt
  /root/flag.txt
  /home/flag.txt
  /home/kato/flag.txt
  /var/flag.txt
  /var/log/flag.txt
  /var/tmp/flag.txt
  /tmp/flag.txt
  /opt/flag.txt
  /srv/flag.txt
  /dev/flag.txt
  /dev/char/flag.txt
  /proc/flag.txt
  /sys/flag.txt
  /run/flag.txt
  /lib/flag.txt
  /usr/lib/flag.txt
  /mnt/flag.txt
  /media/flag.txt
  /var/backups/flag.txt
)

for file in "${FILES[@]}"; do
  if [ -f "$file" ] && [ -s "$file" ]; then
    echo "[+] Found real flag in: $file"
    cat "$file"
    exit 0
  fi
done