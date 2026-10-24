#!/bin/sh
# Builds the hostable pages from site.html.
# index.html opens on Home, support.html on Support and privacy.html on the Privacy policy.
cd "$(dirname "$0")"

page() {
  {
    printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n'
    printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
    printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
    printf '<script>window.START_VIEW="%s"</script>\n</head>\n<body>\n' "$1"
    cat site.html
    printf '\n</body>\n</html>\n'
  } > "$2"
}

page home index.html
page support support.html
page privacy privacy.html
echo "Built index.html, support.html and privacy.html"
