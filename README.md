# 修士論文のLaTeXテンプレート

東京工芸大学の大学院生のための修士論文のLaTeXテンプレートである．

## 機能

- LuaLaTeX / [jlreq](https://tug.org/docs/latex/jlreq/jlreq-ja.html)準拠
- Dockerに対応
- [textlint](https://textlint.org/)による文章校正
- GitHub Actionsによる自動ビルドおよびLint
- Claude Codeに対応

## 文書の例

| タイトル | 論文要旨 | 目次 | 本文 | 要旨 |
|:---:|:---:|:---:|:---:|:---:|
| <img width="100%" src="https://github.com/user-attachments/assets/3892bd01-6821-44c8-8112-9a67ad1c7ff6"/> | <img width="100%" src="https://github.com/user-attachments/assets/9ad0a3b6-2929-442a-9b69-af0f55ee88b7" /> | <img width="100%" src="https://github.com/user-attachments/assets/4516ebba-35c1-4383-b174-2aaa848785de" /> | <img width="100%" src="https://github.com/user-attachments/assets/f019c761-7545-40af-9b82-a72154ca65b7" /> | <img width="100%" src="https://github.com/user-attachments/assets/f37b4e6c-0a85-4a08-a6ca-bc181a5effe4" />

## セットアップ

右上の「Use this template」ボタンをクリックして，自分のGitHubアカウントに新しくリポジトリを作成する．またはZipファイルでダウンロードする．

### Dev Container

このリポジトリは，Visual Studio Codeの[Dev Container機能](https://code.visualstudio.com/docs/devcontainers/containers)を使用して，LaTeX環境を簡単にセットアップできるようになっている．事前に[Docker](https://www.docker.com/ja-jp/products/docker-desktop/)と[Dev Containers拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)をインストールする必要がある．

1. リポジトリをクローンする．
2. Visual Studio Codeでクローンしたリポジトリを開く．
3. 画面右下の「コンテナで再度開く」をクリックする．

### GitHub Codespaces

[GitHub Codespaces](https://github.co.jp/features/codespaces)を使用して，クラウド上でLaTeX環境をセットアップできる．

1. リポジトリのページにアクセスする．
2. 画面右上の「Code」ボタンをクリックし，「Open with Codespaces」を選択する．
3. 新しいCodespaceを作成する．

### Overleaf

本テンプレートをアップロード後，設定からコンパイラを`LuaLaTeX`に変更する．

> [!WARNING]
> Overleafでの動作は未検証である．

## 文書の編集

タイトルや著者情報については[`meta.tex`](meta.tex)を編集する．本文を分割する場合は[`chapters/`](./chapters)に配置する．

### 参考文献

参考文献は[`bibliography/`](bibliography/)に記載する．

日本語論文を記載する場合は，以下のように`keywords = {ja}`をつける必要がある．

```bibtex
@inproceedings{yamada2021,
  author    = {{山田 太郎} and {佐藤 花子}},
  title     = {日本語タイトルの研究},
  booktitle = {第30回 情報処理学会全国大会講演論文集},
  year      = {2021},
  pages     = {1--6},
  keywords = {ja},
}
```

### コンパイル

```bash
# 要旨
latexmk abstract.tex
# 本文
latexmk thesis.tex
```

## 文章校正

[textlint](https://textlint.org/)を使用した文章校正をサポートしている．

```bash
pnpm lint
```

各自のユースケースに合わせて[`.textlintrc.json`](.textlintrc.json)を調整すること．
