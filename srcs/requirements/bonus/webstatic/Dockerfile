FROM debian:buster

WORKDIR /var/hugo/static

RUN apt-get update && apt-get install -y hugo \
                    && apt-get install git -y

RUN hugo new site /var/hugo/static \
                    && cd /var/hugo/static \
                    && git clone https://github.com/LordMathis/hugo-theme-nix themes/nix \
                    && mkdir -p /var/hugo/static/content \
                    && hugo -b https://thoribal.42.fr/static

COPY ./conf/config.toml /var/hugo/static/config.toml

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://thoribal.42.fr/static", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]