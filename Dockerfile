FROM python:3.13

# uv builds the venv for the requested Python version, downloading it if this image lacks it
RUN pip3 install --no-cache-dir uv

COPY requirements.txt /app/requirements.txt

COPY /platformio_dependabot /app/platformio_dependabot
COPY entrypoint.sh /app/entrypoint.sh
