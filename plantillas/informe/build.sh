#!/usr/bin/env bash
# Uso: build.sh fuente.md salida.pdf
# Metadatos YAML: title, short, date, meta, series, modo (diario|completo; por defecto completo)
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$(realpath "$1")"; OUT="$(realpath -m "$2")"
cd "$(dirname "$SRC")"
pandoc "$SRC" -f markdown+tex_math_dollars+fenced_divs+pipe_tables -t latex \
  --template="$DIR/report.tex" -V templatedir="$DIR" --lua-filter="$DIR/filters.lua" --pdf-engine=xelatex \
  --toc --toc-depth=1 -o "$OUT"
echo "PDF: $OUT ($(pdfinfo "$OUT" | awk '/Pages/{print $2}') págs.)"
