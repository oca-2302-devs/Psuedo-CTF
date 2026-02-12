# File extension

## 解説
### 今回の問題は疑う心を持つ必要がある

ファイルを調査するときは必ずファイルの実態が何であるか確認する。

例:  
1. 悪意のある社員が、会社の機密データを外部へ持ち出そうと考える。
2. 顧客情報をZIPファイルにまとめ、それを.pdfに偽装する。
3. ログ上では「PDFファイルの外部送信」として記録される。
4. インシデント調査において、調査担当者が「PDFだから問題ない」と判断し、内容を確認しない。
5. 結果として不正は見逃され、内部不正は発覚しない。

> 人は無意識のうちに思い込みで判断してしまうことがある。  
だからこそ、このような見落としを防ぐためにも、拡張子や見た目に惑わされず、ファイルの実態を確認することが重要である。

## 解法
```bash
$ file secret.pdf
secret.pdf: Zip archive data, at least v2.0 to extract, compression method=store

$ mv secret.pdf secret.zip

$ unzip secret.zip
Archive:  secret.zip
   creating: secret
  inflating: secret/flag.txt

$ cat secret/flag.txt
katoCTF{***}
```