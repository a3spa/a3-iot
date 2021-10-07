#!/bin/sh
PWD=$(dirname "${0}")
cd $PWD

DIR_ENV="$PWD/.venv"
PYTHON="$DIR_ENV/bin/python"

mkdir -p .ci
path_success=".ci/success_env.txt"
[ ! -f "$path_success" ] && rm -rf "$DIR_ENV"
python3 -m venv "$DIR_ENV"
touch "$path_success"
mkdir -p "src"
"$DIR_ENV/bin/pip" install -e . -i "$PYPI"
[ "$?" -ne 0 ] && return 1
if [ -d "tests" ]; then
    "$DIR_ENV/bin/pytest" "tests"
    local code="$?"
    [ "$code" -ne 5 ] && [ "$code" -ne 0 ] && return 1
fi