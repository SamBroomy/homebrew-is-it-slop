class IsItSlop < Formula
  desc "Detect AI-generated text"
  homepage "https://github.com/SamBroomy/is-it-slop"
  license "MIT"
  version "0.6.0-alpha.5"

  on_macos do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-alpha.5/is-it-slop-aarch64-apple-darwin.tar.gz"
      sha256 "d445c658ae03ef8875e9792dcea0a5eddc109ecea6f417396b675cf2f7048eeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-alpha.5/is-it-slop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3160aadf79be37c5ae7db74e8f0587f0d44a0338468d0169f36cf30a177a88f0"
    end
    on_intel do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-alpha.5/is-it-slop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec641006934966edded1c5d4a6303f61cd35a2a674a4fa7073f03f53c7409b57"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/is-it-slop --version")
  end
end
