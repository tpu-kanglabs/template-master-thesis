FROM texlive/texlive:TL2025-historic@sha256:b075993bb0e7cca3c70f668d156a95cdd6494252a72c060a7b2f761f7a460790

ENV MISE_DATA_DIR=/mise \
    MISE_CONFIG_DIR=/mise \
    MISE_CACHE_DIR=/mise/cache \
    MISE_INSTALL_PATH=/usr/local/bin/mise \
    PATH="/mise/shims:${PATH}"

COPY .mise.toml /mise/config.toml

RUN find /etc/apt -name '*.list' -o -name '*.sources' | \
        xargs sed -i 's|http://ftp.de.debian.org/debian|http://ftp.jp.debian.org/debian|g' 2>/dev/null || true \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://mise.run | sh \
    && mise install \
    && chmod -R a+rX /mise
