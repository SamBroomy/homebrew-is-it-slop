class IsItSlop < Formula
  desc "Detect AI-generated text"
  homepage "https://github.com/SamBroomy/is-it-slop"
  license "MIT"
  version "0.6.0-beta.1"

  on_macos do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-beta.1/is-it-slop-aarch64-apple-darwin.tar.gz"
      sha256 "3f88a0d017d598f05001c00254090c0b06f3b4bd02f8d940a5b9949727f6a47c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-beta.1/is-it-slop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83fa39583adc977de66017112d5f8c0dc43caa051f9923f123774bc0283b4de9"
    end
    on_intel do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.0-beta.1/is-it-slop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14bb01b475d861140beeacc9286645f8874c3507af49d8551301e43c932bab1e"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/is-it-slop --version")
  end
end
