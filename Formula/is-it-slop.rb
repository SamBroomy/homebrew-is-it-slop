class IsItSlop < Formula
  desc "Detect AI-generated text"
  homepage "https://github.com/SamBroomy/is-it-slop"
  license "MIT"
  version "0.6.0-beta.0"

  on_macos do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-beta.0/is-it-slop-aarch64-apple-darwin.tar.gz"
      sha256 "2dcab5f71c11a193138420f4fc26c3f76410164ca5363202c5b7b76957ae1327"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-beta.0/is-it-slop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9268948a5f39299e4d43e234346d409c54e0931166253a3f184bce31e2e465b"
    end
    on_intel do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-beta.0/is-it-slop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9820781c8f64066abf0ec34dd2927c58d22c854a930d59253121209a0b26941"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/is-it-slop --version")
  end
end
