# 修士論文のLaTeXテンプレート

東京工芸大学の大学院生のための修士論文のLaTeXテンプレートである．

## セットアップ

右上の「Use this template」ボタンをクリックして、自分のGitHubアカウントに新しくリポジトリを作成してください．

### Dev Container

このリポジトリは、Visual Studio CodeのDev Container機能を使用して、LaTeX環境を簡単にセットアップできるようになっている。Dev Containerを使用することで、ローカルマシンにLaTeXをインストールすることなく、コンテナ内で作業できる．

1. リポジトリをクローンする．
2. Visual Studio Codeでクローンしたリポジトリを開く．
3. 画面右下の「コンテナで再度開く」をクリックする．

### GitHub Codespaces

GitHub Codespacesを使用して、ブラウザ上でLaTeX環境をセットアップできる．

1. リポジトリのページにアクセスする．
2. 画面右上の「Code」ボタンをクリックし、「Open with Codespaces」を選択する．
3. 新しいCodespaceを作成する．

## 論文情報の設定

`thesis.tex` の冒頭にある以下のマクロを各自の情報に書き換えること．

```latex
\thesistitle{修士論文のタイトル}       % 論文タイトル（\\ で改行可）
\authorname{工芸 太郎}                % 氏名
\studentid{2165004}                   % 学籍番号
\department{電子情報工学専攻}          % 専攻名
\laboratory{〇〇研究室}               % 研究室名
\supervisor{指導 教員}{教授}          % 指導教員（氏名, 役職）
\fiscalyear{2025}                     % 提出年度
\submitdate{2026}{3}                  % 提出年月
```

## 文書のビルド

```bash
# 要旨
latexmk abstract.tex
# 本文
latexmk thesis.tex
```

## 章の追加

1. `chapters/` に新しい `.tex` ファイルを作成する．
2. `thesis.tex` の `\mainmatter` ブロック内に `\include{chapters/NN_name}` を追加する．

## 謝辞・参考文献

`thesis.tex` の `\backmatter` ブロックに含まれている．

```latex
\backmatter
\begin{acknowledgements}
謝辞本文...
\end{acknowledgements}

\printbibliography[title=参考文献]
```

## Lint

```bash
# textlintによる文書のLint
pnpm lint
```
