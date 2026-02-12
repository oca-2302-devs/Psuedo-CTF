# Log files

## 解説
### 今回の問題は大量のデータから必要な情報を取り出す力

### 対象ファイル
```bash
-rw-r--r-- 1 kato kato 122446 Feb 12 00:45 access.log
-rw-r--r-- 1 kato kato 160471 Feb 12 01:53 auth.log
-rw-r--r-- 1 kato kato 115465 Feb 12 00:45 syslog
```
- grep: ファイル内から特定の文字列パターンを検索するコマンド
- 基本形: `grep [オプション] パターン ファイル名`

CTFでも現場でも同様に大量のログデータを見ることがある。  
その中で必要な情報をピックアップすることで作業効率が大幅に上がる。

> 参考に使い方載せるけど、全部覚える必要はない  
こういうことができるってのを知っておいて欲しい

| オプション | 意味 | 例 |
| ------ | --------------- | ------------------- |
| `-i`   | 大文字小文字無視        | `grep -i kato`      |
| `-n`   | 行番号表示           | `grep -n kato`      |
| `-r`   | 再帰検索            | `grep -r kato .`    |
| `-v`   | マッチしない行表示       | `grep -v kato`      |
| `-o`   | マッチ部分のみ表示       | `grep -o '[0-9]\+'` |
| `-E`   | 拡張正規表現          | `grep -E 'kato+'`      |
| `-F`   | 正規表現を使わず固定文字列検索 | `grep -F 'k++o'`     |
| `-c`   | マッチ行数カウント       | `grep -c kato`     |
| `-l`   | マッチしたファイル名だけ表示  | `grep -l kato *`    |
| `-C n` | 前後n行表示          | `grep -C 3 kato`   |
| `-A n` | 後ろn行            | `grep -A 3 kato`   |
| `-B n` | 前n行             | `grep -B 3 kato`   |

| 機能        | 基本正規表現 (BRE) | 拡張正規表現 (ERE/-E) | 説明 |
| --------- | ------------ | ----------------- | ---------- |
| `.`       | ○            | ○                 | 任意の1文字     |
| `*`       | ○            | ○                 | 直前の文字を0回以上 |
| `^`       | ○            | ○                 | 行頭         |
| `$`       | ○            | ○                 | 行末         |
| `[]`      | ○            | ○                 | 文字クラス      |
| `[^]`     | ○            | ○                 | 否定文字クラス    |
| `\+`      | ○            | `+`               | 1回以上       |
| `\?`      | ○            | `?`               | 0回または1回    |
| `\\|`     | ○            | `\|`              | または          |
| `\(` `\)` | ○            | `()`              | グループ化      |
| `{m,n}`   | `\{m,n\}`    | `{m,n}`           | 回数指定       |


## 解法
```bash
kato@katoctf:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos  logs

kato@katoctf:~$ cd logs/

kato@katoctf:~/logs$ ls
access.log  auth.log  syslog

kato@katoctf:~/logs$ grep -i 'katoCTF{.*}' auth.log
Feb 12 10:17:36 katoctf debug: katoCTF{***}
```