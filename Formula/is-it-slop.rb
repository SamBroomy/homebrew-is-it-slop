class IsItSlop < Formula
  desc "Detect AI-generated text"
  homepage "https://github.com/SamBroomy/is-it-slop"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0/is-it-slop-aarch64-apple-darwin.tar.gz"
      sha256 "fb81d7ddee3b731b389a2adcf9fb3edb0d763aba5a3c46fa9c57878800c7ad09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0/is-it-slop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecc600dfae6ff78d5ebcb097fbfd16467377aecc3a15308cda464b67d054c494"
    end
    on_intel do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0/is-it-slop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0d45f01fa1311fcb21ba455743eb32bb244af0ee6df7151f3c52c09e1fa1f53"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/is-it-slop --version")
  end
end
