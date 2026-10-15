#!/bin/sh
# Builds index.html for GitHub Pages from demo/hero.html (the page source used for previews).
set -e
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>' '<html lang="pl">' '<head>' '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<meta name="description" content="Deja Design, Milena Rajchel-Deja. Kompleksowe projektowanie wnętrz: mieszkania, domy, biura. Radom, Warszawa i cała Polska online.">' \
    '<style>body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>' '</head>' '<body>'
  sed -E 's/(src|href)="([a-z0-9-]+\.webp)"/\1="demo\/\2"/g' demo/hero.html
  printf '%s\n' '</body>' '</html>'
} > index.html
