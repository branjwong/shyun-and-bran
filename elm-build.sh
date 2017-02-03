#! /bin/sh

# The script that builds the Elm files.
# When adding a new page, make sure the the script entry is added as well.
# Needs '&&' so that the script stops when it hits a compiler error.

elm-make ./src/App.elm --output ./dist/js/app.js

# elm-make ./src/App.elm