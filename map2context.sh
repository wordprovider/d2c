#!/bin/bash

DITAMAP="../orm/en/ope_bookmap_root.ditamap"
OUTPUT="output/out.tex"
XSLT="xslt/map2context.xsl"

rm output/*.*

echo Transforming ditamap...
xsltproc --novalid -o $OUTPUT $XSLT $DITAMAP 
echo Transformation finished.

echo Creating PDF...
cd output
texexec out.tex

evince out.pdf
