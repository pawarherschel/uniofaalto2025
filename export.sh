#!/usr/bin/env -S bash -x
typst compile --format png script.typ script/png/page-{0p}-of-{t}.png --features html --ppi 288
typst compile --format svg script.typ script/svg/page-{0p}-of-{t}.svg --features html --ppi 288
typst compile script.typ --features html --ppi 288 --pdf-standard ua-1

typst compile --format png slides.typ slides/png/slide-{0p}-of-{t}.png --features html --ppi 288
typst compile --format svg slides.typ slides/svg/slide-{0p}-of-{t}.svg --features html --ppi 288
typst compile slides.typ --features html --ppi 288 --pdf-standard ua-1
./touying-export.sh

typst compile Introduction_Video.typ --features html --ppi 288 --pdf-standard ua-1
typst compile Portfolio-pawar-herschel.typ --features html --ppi 288 --pdf-standard ua-1

