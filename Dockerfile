FROM alpine as builder
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN apk add --no-cache gcc python3 python3-dev py3-pip py3-requests py3-beautifulsoup4 ffmpeg libffi-dev && \
    pip install --no-cache-dir --break-system-packages discord-py-interactions[voice] && \ 
    apk del gcc python3-dev py3-pip libffi-dev
CMD [ "python", "/usr/src/app/bot.py" ]
