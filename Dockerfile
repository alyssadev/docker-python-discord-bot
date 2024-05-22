FROM alpine as builder
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache wget gcc python3 python3-dev py3-pip py3-requests py3-beautifulsoup4 ffmpeg libffi-dev yt-dlp jq ffmpeg-libswresample shine && \
    wget https://github.com/savonet/liquidsoap/releases/download/v2.2.3/liquidsoap-x86_64-2.2.3-r0.apk && \
    apk add --allow-untrusted liquidsoap-x86_64-2.2.3-r0.apk && \
    rm liquidsoap-x86_64-2.2.3-r0.apk && \
    pip install --no-cache-dir --break-system-packages discord-py-interactions[voice] flask discord.py && \ 
    apk del gcc python3-dev py3-pip libffi-dev wget
CMD [ "python", "/usr/src/app/bot.py" ]
