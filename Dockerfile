FROM ubuntu:20.04 AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/download/ollama-linux-amd64.tgz -o ollama-linux-amd64.tgz
RUN tar -C /usr -xzf ollama-linux-amd64.tgz && \
    rm ollama-linux-amd64.tgz

FROM base

COPY --from=base /usr/bin/ollama /usr/bin/

CMD [ "ollama", "serve" ]