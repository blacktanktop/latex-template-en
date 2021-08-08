# Latex-Template-EN

## 概要
* commitをpushすればGitHub Actionsによってビルドされる。
* デフォルトテンプレートは[IEEE conference format](https://www.ieee.org/conferences/publishing/templates.html)
* tagをpushすればリリースも可能。
* 基本ローカル環境で確認したものをpushする前提で作成

## 使い方
### ローカルでビルドしたいだけのとき
* ローカルでDockerを使える状態にする。
* このテンプレートを**fork**する。
* 自分が使いたい論文のTeXフォーマットと差し替える。
* 論文の内容を書くメインのtexファイル名をmain.texと変える。
* ```make latexmk``` を実行。
### GitHub Actionを使ってリリースしたいとき
* **ローカルでビルドしたいだけのとき** までを実行する
* GitHubにmainにpushする。(これだけではReleaseされない)
* ```git tag -a vtest -m 'テスト'``` のようにtagをcommitする。
* ```git push origin vtest``` tagをpushする。
* これできちんとビルド出来る状態のものをpushしていればReleasesのところにmain.pdfができる。

[**注意**]pushがCIのフックになっているので、軽いcommitでCIを回したくないときは
  * ```git commit -m "Fix result section. skip ci"``` のように**skip ci**という文字列をコミットメッセージに入れる

#### ローカルで実行に問題が発生したとき（TeX詳しくないので適当な対応策）
* とりあえずエラーを読む。（よくわからん事が多い）
* ```.latexmkrc``` の 
  * ```$latex``` の```pdflatex```を```updflatex```, ```platex```, ```uplatex```に変えたりする。(そんなようなコメントが出ているときがあるので気付けるはず）
  * ```$latex_silent``` 上と同じものに変更
* bblとかリファレンス周りで変なことがおきていそうなら
  * ```$bibtex``` の```upbibtex```を ```pbibtex```に変えたりする。

## 参考
GitHub Actions部分は https://github.com/metaVariable/latex-ci-template を参考にしました。

Makefile部分は https://github.com/p-geon/DockerBonsai/tree/main/paper-writing を参考にしました。

