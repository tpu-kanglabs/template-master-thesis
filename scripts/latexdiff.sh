#!/usr/bin/env bash
# Usage: scripts/latexdiff.sh <rev> [thesis|abstract]...
# Build diff PDFs between <rev> and the working tree: out/<name>-diff<rev>.pdf
set -euo pipefail

cd "$(dirname "$0")/.."

rev=${1:?usage: $0 <rev> [thesis|abstract]...}
shift
targets=("$@")
[ ${#targets[@]} -gt 0 ] || targets=(thesis abstract)

for name in "${targets[@]}"; do
    latexdiff-vc --git --flatten -r "$rev" "${name}.tex"
    latexmk "${name}-diff${rev}.tex"
    rm -f "${name}-diff${rev}.tex"
done
