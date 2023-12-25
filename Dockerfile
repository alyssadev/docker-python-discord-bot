FROM alpine
WORKDIR /usr/src/app
COPY . .
RUN apk add --no-cache gcc python3 python3-dev py3-pip py3-requests py3-beautifulsoup4 && \
    python3 -m venv env && \
    . env/bin/activate && \
    pip install --no-cache-dir discord-py-interactions
CMD [ "env/bin/python", "./bot.py" ]
