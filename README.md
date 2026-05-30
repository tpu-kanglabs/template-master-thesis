# 修士論文のLaTeXテンプレート

東京工芸大学の大学院生のための修士論文のLaTeXテンプレートである．

## セットアップ

右上の「Use this template」ボタンをクリックして，自分のGitHubアカウントに新しくリポジトリを作成する．

### Dev Container

このリポジトリは，Visual Studio CodeのDev Container機能を使用して，LaTeX環境を簡単にセットアップできるようになっている．Dev Containerを使用することで，ローカルマシンにLaTeXをインストールすることなく，コンテナ内で作業できる．

1. リポジトリをクローンする．
2. Visual Studio Codeでクローンしたリポジトリを開く．
3. 画面右下の「コンテナで再度開く」をクリックする．

### GitHub Codespaces

GitHub Codespacesを使用して，ブラウザ上でLaTeX環境をセットアップできる．

1. リポジトリのページにアクセスする．
2. 画面右上の「Code」ボタンをクリックし，「Open with Codespaces」を選択する．
3. 新しいCodespaceを作成する．

## 文書のビルド

```bash
# 要旨
latexmk abstract.tex
# 本文
latexmk thesis.tex
```

## Lint

```bash
# textlintによる文書のLint
pnpm lint
```
