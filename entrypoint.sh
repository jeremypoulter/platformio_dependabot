#!/bin/sh -l

git config --global --add safe.directory /github/workspace
git config --global user.name 'github-actions[bot]'
git config --global user.email 'github-actions[bot]@users.noreply.github.com'

uv venv --quiet --python "${INPUT_PYTHON_VERSION:-3.13}" /app/venv
uv pip install --quiet --python /app/venv/bin/python -r /app/requirements.txt

export PYTHONPATH=$PYTHONPATH:/app
/app/venv/bin/python -m platformio_dependabot
