# Hash cracking

## 解説
### 今回の問題はハッシュ値のクラッキング手法を学ぼう

ハッシュ値の特性は  
- 入力データのサイズに関係なく、出力は常に一定の長さ
- 同じ入力なら必ず同じハッシュ値
- ハッシュ値から元の入力を実用的(一般的なワードはクラッキング対象)

例:  
1. ユーザー管理サイトのデータベースにパスワードを保存している(ハッシュ値に変換して保存)
2. 攻撃者はデータベースのデータを不正に取得する
3. 取得したハッシュ値を一般的に使用されるワードリストをもとにクラッキング
4. 特定したパスワードを用いて、当該ユーザーになりすましてログインする

今回用意した hash.txt や wordlist.txt はこのようなケースを想定したものになる。

### hashcatコマンドについて

| オプション               | 意味             | 使用例                    | 解説                 |
| ------------------- | -------------- | ---------------------- | ------------------ |
| `-m`                | ハッシュタイプ指定      | `-m 0`                 | 例: 0=MD5, 100=SHA1 |
| `-a`                | 攻撃モード指定        | `-a 0`                 | 0=辞書, 3=マスク        |
| `-o`                | 出力ファイル         | `-o cracked.txt`       | クラック結果保存           |
| `--show`            | クラック済表示        | `--show hashes.txt`    | 後から確認              |
| `--username`        | username付きハッシュ | `--username`           | `user:hash`形式用     |
| `-r`                | ルールファイル        | `-r rules/best64.rule` | 辞書変形               |
| `-w`                | ワークロード         | `-w 3`                 | 1〜4（4が最速）          |
| `-O`                | 最適化モード         | `-O`                   | 長さ制限あり             |
| `--force`           | 強制実行           | `--force`              | 警告無視               |
| `--status`          | ステータス表示        | `--status`             | 進行状況確認             |
| `--status-timer`    | ステータス更新秒       | `--status-timer=10`    | 10秒毎更新             |
| `--potfile-disable` | potfile無効      | `--potfile-disable`    | 再利用防止              |
| `--session`         | セッション名         | `--session test1`      | 中断再開用              |
| `--restore`         | セッション復元        | `--restore`            | 中断続き               |

よく使うハッシュタイプ（-m）
| ID    | ハッシュ             |
| ----- | ------------------- |
| 0     | MD5                 |
| 100   | SHA1                |
| 1400  | SHA256              |
| 1700  | SHA512              |
| 1000  | NTLM                |
| 5600  | NetNTLMv2           |
| 1800  | sha512crypt (Linux) |
| 3200  | bcrypt              |
| 22000 | WPA-PBKDF2          |

### ハッシュ値見分け方

| ハッシュ   | 長さ      |
| ------ | ----------- |
| MD5    | 32          |
| SHA1   | 40          |
| SHA256 | 64          |
| SHA512 | 128         |
| NTLM   | 32(MD4ベース) |


## 解法
### hashcatを用いた手法
```bash
hashcat -m 0 hash.txt wordlist.txt
hashcat (v6.2.5) starting

OpenCL API (OpenCL 2.0 pocl 1.8  Linux, None+Asserts, RELOC, LLVM 11.1.0, SLEEF, POCL_DEBUG) - Platform #1 [The pocl project]
=============================================================================================================================
* Device #1: pthread-0x000, 2862/5788 MB (1024 MB allocatable), 10MCU

Minimum password length supported by kernel: 0
Maximum password length supported by kernel: 256

Hashes: 1 digests; 1 unique digests, 1 unique salts
Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates
Rules: 1

Optimizers applied:
* Zero-Byte
* Early-Skip
* Not-Salted
* Not-Iterated
* Single-Hash
* Single-Salt
* Raw-Hash

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Watchdog: Hardware monitoring interface not found on your system.
Watchdog: Temperature abort trigger disabled.

Host memory required for this attack: 2 MB

Dictionary cache built:
* Filename..: wordlist.txt
* Passwords.: 521
* Bytes.....: 6765
* Keyspace..: 521
* Runtime...: 0 secs

The wordlist or mask that you are using is too small.
This means that hashcat cannot use the full parallel power of your device(s).
Unless you supply more work, your cracking speed will drop.
For tips on supplying more work, see: https://hashcat.net/faq/morework

Approaching final keyspace - workload adjusted.

1d8979da15f795cc9f83c9c47bd19394:katoCTF{***}

Session..........: hashcat
Status...........: Cracked
Hash.Mode........: 0 (MD5)
Hash.Target......: 1d8979da15f795cc9f83c9c47bd19394
Time.Started.....: Thu Feb 12 10:47:24 2026 (0 secs)
Time.Estimated...: Thu Feb 12 10:47:24 2026 (0 secs)
Kernel.Feature...: Pure Kernel
Guess.Base.......: File (wordlist.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#1.........:    23362 H/s (0.08ms) @ Accel:512 Loops:1 Thr:1 Vec:4
Recovered........: 1/1 (100.00%) Digests
Progress.........: 521/521 (100.00%)
Rejected.........: 0/521 (0.00%)
Restore.Point....: 0/521 (0.00%)
Restore.Sub.#1...: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#1....: daydream, -> FAIRYOFDREAMS

Started: Thu Feb 12 10:47:10 2026
Stopped: Thu Feb 12 10:47:26 2026
```