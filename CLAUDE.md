# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LaTeX template for master's theses at Tokyo Polytechnic University (東京工芸大学大学院). It uses LuaLaTeX with the `bxjsreport` document class for Japanese typesetting, and `biblatex`+`biber` with IEEE style for references.

## Build Commands

```bash
# Build the thesis body
latexmk thesis.tex

# Build the abstract (要旨)
latexmk abstract.tex
```

Output PDFs are written to the `out/` directory (configured in `.latexmkrc`). The build uses `pdf_mode = 4` (LuaLaTeX) with `biber` for bibliography processing.

## Document Structure

- `thesis.tex` — root document; defines thesis metadata macros (`\thesistitle`, `\authorname`, `\supervisorname`, `\submityear`, `\submitmonth`) that must be updated for each thesis
- `abstract.tex` — standalone abstract document (uses `bxjsarticle`); title/author/date are hardcoded here and must also be updated
- `chapters/` — one `.tex` file per chapter, included via `\include{}` in `thesis.tex`; each file carries a `% !TEX root = ../thesis.tex` magic comment
- `bibliography/references.bib` — BibTeX database; contains a sample entry to illustrate the format

## Development Environment

The recommended environment is the Dev Container (`.devcontainer/`), which pulls the pre-built image `ghcr.io/tpu-kanglabs/texlive:latest`. This image is built from `.devcontainer/Dockerfile` (based on `texlive/texlive:TL2025-historic`) and includes Node.js. On container start, `npm ci` runs automatically (for textlint support).

VS Code extensions pre-installed in the container: `latex-workshop` (auto-builds on save, SyncTeX enabled, output dir `out/`) and `textlint` for Japanese prose linting.

## CI

GitHub Actions (`.github/workflows/build.yml`) builds both `thesis.tex` and `abstract.tex` on every push/PR that touches `.tex`, `.bib`, or `.latexmkrc` files. Biber cache is keyed on the `.bib` file hash. Build artifacts (`out/thesis.pdf`, `out/abstract.pdf`) are uploaded as workflow artifacts.

A separate workflow (`.github/workflows/docker.yml`) rebuilds and pushes the `ghcr.io/tpu-kanglabs/texlive:latest` image when `.devcontainer/Dockerfile` changes on `main`.

## Key Conventions

- **Japanese typesetting**: document classes are `bxjsreport` (thesis) and `bxjsarticle` (abstract) with `lualatex,ja=standard` options — do not switch to `pdflatex` or `xelatex`.
- **Bibliography**: always use `biblatex` + `biber` (not `natbib`/`bibtex`). The style is `ieee`.
- **New chapters**: add a file under `chapters/` and add a corresponding `\include{chapters/NN_name}` line in `thesis.tex`.
- **Output directory**: all build artifacts go to `out/` — this directory is gitignored. Intermediate LaTeX files (`.aux`, `.log`, etc.) are also gitignored.
