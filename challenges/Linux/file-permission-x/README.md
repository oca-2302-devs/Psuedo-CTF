# File permission X

## 解説
### 今回の問題は実行権限の理解

### 対象ファイル
```bash
-rw-r--r-- 1 kato kato  692 Feb 12 01:44 flag.sh
```
- 所有者: rw-(読み書き可)
- グループ: r--(読み可)
- その他: r--(読み可)
- 実行権限がない(x)

そのため`./flag.sh`できない  
`./`は実行時にxビットの有無を確認する

今回のケースだと`bash flag.sh`でも動く  
bashがスクリプトをテキストとして読み込んで実行するため、実行ビットが無くても動作する。

しかし、シェルスクリプトであっても、他の実行ファイルと同様に、実行ファイルとして扱う場合は実行権限を付与するのが一般的である。

## 解法
```bash
kato@katoctf:~$ ls -la flag.sh
-rw-r--r-- 1 kato kato 692 Feb 12 01:44 flag.sh
kato@katoctf:~$ chmod +x flag.sh
kato@katoctf:~$ ./flag.sh
[+] Found real flag in: /var/log/flag.txt
katoCTF{***}
```
```bash
# これでも可能
kato@katoctf:~$ bash flag.sh
[+] Found real flag in: /var/log/flag.txt
katoCTF{***}
```