# FROM ghcr.io/aquasecurity/trivy:latest-arm64
FROM --platform=linux/arm64 ghcr.io/aquasecurity/trivy:latest-arm64 AS build-arm64
FROM --platform=linux/amd64 ghcr.io/aquasecurity/trivy:latest-amd64 AS build-amd64

FROM build-$TARGETARCH

RUN trivy image --download-db-only && trivy image --download-java-db-only

ENTRYPOINT [ "trivy", "image", "--skip-db-update", "--skip-java-db-update" ]
