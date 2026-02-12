# Hidden files

## 解説
### 今回の問題は隠しファイルの理解

### 対象ファイル
```bash
drwxr-xr-x 1 kato kato 4096 Feb 12 04:00 .secret
```
- ls: ディレクトリの中身を一覧表示するコマンド
- ls -a: 隠しファイルも含めてすべて表示
- ls -l: 詳細表示

多くのディレクトリ配下には隠しフォルダ・ファイルが存在する  
調査を行うときは常にその存在を意識しながら作業する必要がある

- .git
- .env
- .ssh
- .old
- .backup

こういったファイルは重要な情報に繋がる

## 解法
```bash
kato@katoctf:~$ ls -la
total 68
drwxr-x--- 1 kato kato 4096 Feb 12 04:00 .
drwxr-xr-x 1 root root 4096 Feb 12 02:16 ..
-rw-r--r-- 1 kato kato  220 Jan  6  2022 .bash_logout
-rw-r--r-- 1 kato kato 3771 Jan  6  2022 .bashrc
drwx------ 2 kato kato 4096 Feb 12 04:00 .cache
drwx------ 2 kato kato 4096 Feb 12 03:17 .config
-rw-r--r-- 1 kato kato  807 Jan  6  2022 .profile
drwxr-xr-x 1 kato kato 4096 Feb 12 04:00 .secret
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Desktop
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Documents
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Downloads
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Music
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Pictures
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Public
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Templates
drwxr-xr-x 2 kato kato 4096 Feb 12 03:17 Videos
kato@katoctf:~$ ls -la .secret/
total 12
drwxr-xr-x 1 kato kato 4096 Feb 12 04:00 .
drwxr-x--- 1 kato kato 4096 Feb 12 04:00 ..
-rw-r--r-- 1 kato kato   30 Feb 12 01:50 flag.txt
kato@katoctf:~$ cat .secret/flag.txt
katoCTF{***}
```