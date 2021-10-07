#!/bin/sh
PATH_DIR_CUR=$(dirname "${0}")
cd $PATH_DIR_CUR

DIR_ENV="$PWD/.venv"
PYTHON="$DIR_ENV/bin/python"
"$PYTHON" -m "app.main"
