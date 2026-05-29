# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LaTeX template for master's theses at Tokyo Polytechnic University (東京工芸大学大学院). It uses LuaLaTeX with the custom `tpu-thesis` document class (which wraps `jlreq` for JIS-compliant Japanese typesetting), and `biblatex`+`biber` with IEEE style for references.

## Build Commands

```bash
# Build the thesis body
latexmk thesis.tex

# Build the abstract (要旨)
latexmk abstract.tex
```

Output PDFs are written to the `out/` directory (configured in `.latexmkrc`). The build uses `pdf_mode = 4` (LuaLaTeX) with `biber` for bibliography processing.

## Document Structure

- `meta.tex` — **論文メタデータの単一定義箇所**。`tpu-thesis` クラスのメタデータコマンドを設定する。各論文で変更が必要な箇所はここだけ。`thesis.tex` と `abstract.tex` の両方から `\input{meta}` で読み込まれる
- `thesis.tex` — root document; `\input{meta}` でメタデータを読み込み、`\frontmatter`/`\mainmatter`/`\backmatter` 構造で本文を構成する
- `abstract.tex` — standalone abstract document (uses `jlreq` article mode); `\input{meta}` でメタデータを参照するため、`meta.tex` を更新すれば自動的に同期される
- `latex/tpu-thesis.cls` — custom document class wrapping `jlreq`; defines the cover page layout, heading styles, and all metadata commands
- `chapters/` — one `.tex` file per chapter, included via `\input{}` in `thesis.tex`; each file carries a `% !TEX root = ../thesis.tex` magic comment
- `bibliography/references.bib` — BibTeX database; contains a sample entry to illustrate the format

## Metadata Macros (in `meta.tex`)

| Macro | Description | Example |
|---|---|---|
| `\thesistitle{...}` | Thesis title in Japanese (supports `\\` for line breaks) | `修士論文のタイトル` |
| `\thesistitleeng{...}` | Thesis title in English | `Thesis Title in English` |
| `\authorname{...}` | Author's name in Japanese | `工芸 太郎` |
| `\authornameeng{...}` | Author's name in English (romaji) | `Taro Kogei` |
| `\studentid{...}` | Student ID number | `2563000` |
| `\department{...}` | Graduate program name | `工学専攻` |
| `\laboratory{...}` | Laboratory name | `〇〇研究室` |
| `\supervisor{name}{role}` | Supervisor name and title | `\supervisor{工芸 花子}{教授}` |
| `\fiscalyear{...}` | Academic year (年度) shown on cover | `2026` |
| `\submitdate{year}{month}` | Submission year and month | `\submitdate{2027}{3}` |

## Abstract Environments

The class provides two environments for abstract pages, placed in `\frontmatter` before `\tableofcontents`:

- `abstract` — English abstract: displays `\thesistitleeng` + `\authornameeng` + "Abstract" heading
- `jabstract` — Japanese abstract: displays `\thesistitle` + `\authorname` + "概要" heading

Abstract content is kept in `chapters/00_abstract_ja.tex` and `chapters/00_abstract_en.tex`.

## Development Environment

The recommended environment is the Dev Container (`.devcontainer/`), which pulls the pre-built image `ghcr.io/tpu-kanglabs/texlive:latest`. This image is built from `.devcontainer/Dockerfile` (based on `texlive/texlive:TL2025-historic`) and includes Node.js. On container start, `pnpm i --frozen-lockfile` runs automatically (for textlint support).

VS Code extensions pre-installed in the container: `latex-workshop` (auto-builds on save, SyncTeX enabled, output dir `out/`) and `textlint` for Japanese prose linting.

## CI

GitHub Actions (`.github/workflows/build.yml`) builds both `thesis.tex` and `abstract.tex` on every push/PR that touches `.tex`, `.bib`, or `.latexmkrc` files. Biber cache is keyed on the `.bib` file hash. Build artifacts (`out/thesis.pdf`, `out/abstract.pdf`) are uploaded as workflow artifacts.

A separate workflow (`.github/workflows/docker.yml`) rebuilds and pushes the `ghcr.io/tpu-kanglabs/texlive:latest` image when `.devcontainer/Dockerfile` changes on `main`.

## Key Conventions

- **Japanese typesetting**: `thesis.tex` uses the custom `tpu-thesis` class (backed by `jlreq` + LuaLaTeX). `abstract.tex` uses `jlreq` in article mode. Do not switch to `pdflatex` or `xelatex`.
- **Custom class location**: `latex/tpu-thesis.cls` is found via `TEXINPUTS=./latex//` set in `.latexmkrc`. Do not move the cls file without updating `.latexmkrc`.
- **Metadata**: all thesis-specific settings live in `meta.tex`. Edit only that file when customizing for a specific thesis. `abstract.tex` defines setter shims so `\input{meta}` works without `tpu-thesis.cls`.
- **Bibliography**: always use `biblatex` + `biber` (not `natbib`/`bibtex`). The style is `ieee`. `biblatex` is pre-loaded by `tpu-thesis.cls`; use `\addbibresource` in `thesis.tex` to register the `.bib` file.
- **Document flow**: cover page → `\frontmatter` (Japanese abstract, English abstract, TOC; roman page numbers) → `\mainmatter` (chapters, arabic page numbers) → `\backmatter` (acknowledgements + bibliography).
- **New chapters**: add a file under `chapters/` and add a corresponding `\input{chapters/NN_name}` line in `thesis.tex` inside the `\mainmatter` block.
- **Output directory**: all build artifacts go to `out/` — this directory is gitignored. Intermediate LaTeX files (`.aux`, `.log`, etc.) are also gitignored.
