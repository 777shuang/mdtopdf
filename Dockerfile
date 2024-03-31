FROM pandoc/minimal:latest-ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
        apt install texlive-luatex texlive-lang-cjk lmodern texlive-xetex \
        texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra latexmk git latexdiff -y && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN kanji-config-updmap-sys ipaex

COPY scripts/ /usr/local/bin/
COPY crossref_config.yaml /config/crossref_config.yaml
COPY listings-setup.tex /config/listings-setup.tex

VOLUME /workdir
WORKDIR /workdir
