#! /bin/sh

# The script that builds the CSS files.
# When adding a new page, make sure the the script entry is added as well.
# Needs '&&' so that the script stops when it hits a compiler error.

elm-css client/style/Stylesheets.elm -o backend/app/static/app/css