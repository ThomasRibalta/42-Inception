FROM debian:buster

RUN apt update -y && \
    apt install -y wget libc6 && \
    wget https://github.com/google/cadvisor/releases/download/v0.50.0/cadvisor-v0.50.0-linux-arm64 -O cadvisor && \
    chmod +x cadvisor

CMD ["./cadvisor"]
