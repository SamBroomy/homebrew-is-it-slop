# homebrew-is-it-slop

## Install

### Python

```bash
pipx install is-it-slop
```

### Homebrew

```bash
brew tap SamBroomy/is-it-slop
brew install is-it-slop
```

Homebrew binaries are provided for macOS ARM64, Linux ARM64, and Linux x86_64.
Intel macOS is excluded because ONNX Runtime does not provide prebuilt binaries.

### cargo-binstall

```bash
cargo binstall is-it-slop
```

## Upgrade

```bash
pipx upgrade is-it-slop
brew update && brew upgrade is-it-slop
cargo binstall --force is-it-slop
```

## Homebrew tap setup (maintainers)

1. Create a public tap repository at `SamBroomy/homebrew-is-it-slop`.
2. Create a classic PAT with `repo` scope and set it as the `HOMEBREW_TAP_TOKEN` Actions secret in the main repository.