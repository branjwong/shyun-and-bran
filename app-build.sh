#! /bin/sh

# The script that builds the Elm files.
# When adding a new page, make sure the the script entry is added as well.
# Needs '&&' so that the script stops when it hits a compiler error.

elm-make ./client/App.elm --output ./backend/app/static/app/app.js