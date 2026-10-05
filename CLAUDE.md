# CLAUDE.md

## Build

```bash
latexmk thesis.tex
latexmk abstract.tex
```

Outputs are written to `out/`.

If the local environment does not provide a LaTeX runtime or required tools, try building with the Docker image `ghcr.io/tpu-kanglabs/texlive`.

## Rules

- Edit thesis metadata only in `meta.tex`.
- Place custom LaTeX classes and styles under `latex/`.
- Use LuaLaTeX only.
- Use `biblatex` + `biber` for bibliography management.
- Do not unnecessarily change the existing document structure or build workflow.

## Figures

- Place figure-generation scripts under `scripts/` and use `uv` for execution and dependency management.
- Keep figures reproducible and reuse shared logic to follow DRY principles.
- Keep colors, line styles, markers, and other visual conventions consistent across the thesis; use the same representation for the same meaning.
