FROM alpine
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN apk add --no-cache gcc python3 python3-dev py3-pip py3-requests py3-beautifulsoup4 && \
    python3 -m venv /usr/src/env && \
    . /usr/src/env/bin/activate && \
    pip install --no-cache-dir discord-py-interactions
CMD [ "/usr/src/env/bin/python", "/usr/src/app/bot.py" ]
