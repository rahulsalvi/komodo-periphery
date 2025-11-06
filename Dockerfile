FROM golang:1.25.3-alpine3.22 AS get-authkey

RUN go install tailscale.com/cmd/get-authkey@latest

FROM infisical/cli:0.43.22 AS infisical

FROM ghcr.io/moghtech/komodo-periphery:1.19.5

RUN apt-get update \
  && apt-get install -y ca-certificates \
  && rm -rf /var/lib/apt/lists/*
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN update-ca-certificates

COPY --from=get-authkey /go/bin/get-authkey /usr/local/bin/get-authkey
COPY --from=infisical /bin/infisical /usr/local/bin/infisical

ENV INFISICAL_API_URL=https://infisical.ipn.rahulsalvi.com
