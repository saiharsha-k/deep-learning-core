#!/bin/bash
set -e

OUTPUT_DIR=pytorch/pdf
OUTPUT_FILE=$OUTPUT_DIR/pytorch-core-notes.pdf

mkdir -p $OUTPUT_DIR

pandoc \
--from markdown-yaml_metadata_block \
pytorch/core-notes/README.md \
pytorch/core-notes/01-introduction/*.md \
pytorch/core-notes/02-fundamentals/*.md \
pytorch/core-notes/03-autograd/*.md \
pytorch/core-notes/04-models/*.md \
pytorch/core-notes/05-training/*.md \
pytorch/core-notes/06-data-pipeline/*.md \
pytorch/core-notes/07-evaluation/*.md \
pytorch/core-notes/08-serialization/*.md \
-o pytorch/pdf/pytorch-core-notes.pdf \
--pdf-engine=xelatex

