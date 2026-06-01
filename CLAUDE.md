# CLAUDE.md

東京工芸大学大学院 修士論文の LaTeX テンプレート。LuaLaTeX + jlreq + biblatex/biber（IEEE スタイル）を使用。

## ビルド

```bash
latexmk thesis.tex    # 本文
latexmk abstract.tex  # 要旨
```

出力は `out/` ディレクトリ。

## 論文の設定

**`meta.tex` だけを編集する**。`thesis.tex` と `abstract.tex` の両方が `\input{meta}` で読み込む。

| マクロ | 説明 |
|---|---|
| `\thesistitle{...}` | 論文タイトル（日本語、`\\` で改行可） |
| `\thesistitleeng{...}` | 論文タイトル（英語） |
| `\authorname{...}` | 著者氏名（日本語） |
| `\authornameeng{...}` | 著者氏名（ローマ字） |
| `\studentid{...}` | 学籍番号 |
| `\department{...}` | 専攻名 |
| `\laboratory{...}` | 研究室名 |
| `\supervisor{氏名}{役職}` | 指導教員（例：`\supervisor{工芸 花子}{教授}`） |
| `\fiscalyear{...}` | 表紙の年度 |
| `\submitdate{年}{月}` | 提出年月 |

## 章の追加

`chapters/` に `.tex` ファイルを追加し、`thesis.tex` の `\mainmatter` ブロック内に `\input{chapters/NN_name}` を追記する。

## 参考文献

- `bibliography/references.bib` に BibTeX エントリを追記
- 本文中で `\cite{key}` で引用
- 参考文献リストは `\printreferences`（`\printbibliography[title=参考文献]` の省略形）
- 日本語文献には `keywords = {ja}` タグを付けると著者名区切りをつける

## 概要ページ

`\frontmatter` 内で以下の環境を使用（それぞれ `chapters/00_abstract_*.tex` に記述）：

- `jabstract` — 日本語概要
- `abstract` — 英語概要

## 制約

- エンジンは **LuaLaTeX のみ**（pdflatex・xelatex 不可）
- 参考文献管理は **biblatex + biber のみ**（natbib・bibtex 不可）
- カスタムクラス・スタイルは `latex/` に置く
