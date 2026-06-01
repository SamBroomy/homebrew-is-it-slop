#!/usr/bin/env bash
set -euo pipefail

REPO="SamBroomy/is-it-slop"
INSTALL_DIR="${HOME}/.local/bin"
BINARY_PATH="${INSTALL_DIR}/is-it-slop"

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "${ARCH}" in
  arm64|aarch64) TARGET_ARCH="aarch64" ;;
  x86_64|amd64) TARGET_ARCH="x86_64" ;;
  *)
    echo "Unsupported architecture: ${ARCH}"
    exit 1
    ;;
esac

if [[ "${OS}" == "darwin" && "${TARGET_ARCH}" != "aarch64" ]]; then
  echo "Intel macOS is not supported (ONNX Runtime does not provide prebuilt binaries)."
  exit 1
fi

REPLACING=false
if [[ -f "${BINARY_PATH}" ]]; then
  REPLACING=true
fi

mkdir -p "${INSTALL_DIR}"

if [[ "${OS}" == "darwin" ]]; then
  TARGET_TRIPLE="${TARGET_ARCH}-apple-darwin"
elif [[ "${OS}" == "linux" ]]; then
  TARGET_TRIPLE="${TARGET_ARCH}-unknown-linux-gnu"
else
  echo "Unsupported operating system: ${OS}"
  exit 1
fi

LATEST_TAG="$(
  curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" \
    | grep -m1 '"tag_name"' \
    | sed -E 's/.*"([^"]+)".*/\1/'
)"
ASSET="is-it-slop-${TARGET_TRIPLE}.tar.gz"
URL="https://github.com/${REPO}/releases/download/${LATEST_TAG}/${ASSET}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

curl -fsSL "${URL}" -o "${TMP_DIR}/${ASSET}"
tar -xzf "${TMP_DIR}/${ASSET}" -C "${TMP_DIR}"
install -m 0755 "${TMP_DIR}/is-it-slop" "${BINARY_PATH}"

if [[ "${REPLACING}" == "true" ]]; then
  echo "Replacing existing installation"
fi
echo "Installed is-it-slop ${LATEST_TAG} to ${BINARY_PATH}"
