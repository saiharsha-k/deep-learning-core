#!/bin/bash
set -e

OUTPUT_DIR=pytorch/pdf
OUTPUT_FILE=$OUTPUT_DIR/pytorch-core-notes.pdf
TMP_FILE=/tmp/pytorch_notes_combined.md

mkdir -p "$OUTPUT_DIR"
rm -f "$TMP_FILE"

add_file() {
  if [ -s "$TMP_FILE" ]; then
    echo -e "\n\\newpage\n" >> "$TMP_FILE"
  fi
  cat "$1" >> "$TMP_FILE"
}

add_file pytorch/core-notes/README.md
for f in pytorch/core-notes/01-introduction/*.md; do add_file "$f"; done
for f in pytorch/core-notes/02-fundamentals/*.md; do add_file "$f"; done
for f in pytorch/core-notes/03-autograd/*.md; do add_file "$f"; done
for f in pytorch/core-notes/04-models/*.md; do add_file "$f"; done
for f in pytorch/core-notes/05-training/*.md; do add_file "$f"; done
for f in pytorch/core-notes/06-data-pipeline/*.md; do add_file "$f"; done
for f in pytorch/core-notes/07-evaluation/*.md; do add_file "$f"; done
for f in pytorch/core-notes/08-serialization/*.md; do add_file "$f"; done

pandoc \
--from markdown-yaml_metadata_block \
--pdf-engine=xelatex \
-V mainfont="DejaVu Serif" \
-V monofont="DejaVu Sans Mono" \
-V geometry:margin=1in \
-V fontsize=11pt \
--wrap=none \
"$TMP_FILE" \
-o "$OUTPUT_FILE"
