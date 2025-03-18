# FROM ghcr.io/aquasecurity/trivy:latest-arm64
FROM --platform=linux/amd64 ghcr.io/aquasecurity/trivy:latest-amd64 as build-amd64
FROM --platform=linux/arm64 ghcr.io/aquasecurity/trivy:latest-arm64 as build-arm64

FROM build-$BUILDARCH
# the rest of your build

RUN trivy image --download-db-only && trivy image --download-java-db-only

ENTRYPOINT [ "trivy", "image", "--skip-db-update", "--skip-java-db-update" ]
