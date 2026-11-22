FROM texlive/texlive:TL2025-historic@sha256:b075993bb0e7cca3c70f668d156a95cdd6494252a72c060a7b2f761f7a460790

COPY --from=ghcr.io/jdx/mise:2026.11.12 /usr/local/bin/mise /usr/local/bin/mise

# Tools installed by `mise install --system` live in /usr/local/share/mise (root-owned,
# read-only), so any user can run them without sharing a writable data directory.
# Put the system-wide shims on PATH so the tools can be run by name.
ENV PATH="/usr/local/share/mise/shims:${PATH}"

RUN find /etc/apt -name '*.list' -o -name '*.sources' | \
        xargs sed -i 's|http://ftp.de.debian.org/debian|http://ftp.jp.debian.org/debian|g' 2>/dev/null || true \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/mise-project
COPY .mise.toml ./
RUN mise trust && mise install --system

WORKDIR /workdir
