# Gitをターミナルから使うときのTips

## `.gitconfig` ファイル

gitを使うと、ホームディレクトリに自動的に `.gitconfig` ファイルが生成されます。

```shell
# ホームディレクトリに移動
cd ~
# .gitconfigの存在を確認
ls -a .gitconfig
```

たとえば、userの設定は以下のように書きます。

```shell:.gitconfig
# .gitconfigファイル
[user]
        name = turara
        email = turara.developer@gmail.com
```

## ターミナルでgit statusなどの表示をカラフルにする

次の設定を追加することで、git statusなどのコマンドを打った際に、一部のテキストに色がつきます。

```shell:.gitconfig
# .gitconfigファイル
[color]
        ui = true
```

## ターミナルでよく使うコマンドにaliasを用意する

`.gitconfig`ファイルにコマンドのalias（別名）を表示することができます。

```shell:.gitconfig
# .gitconfigファイル
[alias]
        g = log --graph --date-order --all --pretty=format:'%h %Cred%d %Cgreen%ad %Cblue%cn %Creset%s' --date=short
        s = status
        co = checkout
        cm = commit
        amend = commit --amend
        unstage = reset HEAD --
        discard = checkout --
```

### gitのコミット履歴をいい感じにフォーマットして表示する

```shell:.gitconfig
g = log --graph --date-order --all --pretty=format:'%h %Cred%d %Cgreen%ad %Cblue%cn %Creset%s' --date=short
```

```shell
# git log --graph と打つ代わりに git g と入力する
git g
```

### よく使うコマンドをより短く入力する

```shell:.gitconfig
s = status
co = checkout
cm = commit
amend = commit --amend
```

```shell
git s # git status
git co master # git checkout master
git co -b feature/test # git checkout -b feature/test
git cm -m 'Initial commit' # git commit -m 'Initial commit'
git amend # git commit --amend
```

### インデックスに登録したファイルをインデックスから外す

```shell:.gitconfig
unstage = reset HEAD --
```

```shell
touch test.txt # test.txtを作成
git add test.txt # test.txtをインデックスに登路
git s # git statusでインデックスを確認
git unstage test.txt # test.txtをインデックスから外す
```

### gitに登録されていない変更を元に戻す（なかったことにする）

```shell:.gitconfig
discard = checkout --
```

```shell
echo "last line" >> test.txt # test.txtに "last line" と追加
git s # git statusでtest.txtが変更されていることを確認
git discard test.txt # test.txtの変更を元に戻す
```