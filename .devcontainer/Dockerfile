FROM texlive/texlive:TL2025-historic@sha256:b075993bb0e7cca3c70f668d156a95cdd6494252a72c060a7b2f761f7a460790

# renovate: datasource=node depName=node versioning=node
ARG NODE_VERSION=24.15.0

RUN find /etc/apt -name '*.list' -o -name '*.sources' | \
        xargs sed -i 's|http://ftp.de.debian.org/debian|http://ftp.jp.debian.org/debian|g' 2>/dev/null || true \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION%%.*}.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*
