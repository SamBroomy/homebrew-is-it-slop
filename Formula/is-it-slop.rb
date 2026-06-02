class IsItSlop < Formula
  desc "Detect AI-generated text"
  homepage "https://github.com/SamBroomy/is-it-slop"
  license "MIT"
  version "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.2/is-it-slop-aarch64-apple-darwin.tar.gz"
      sha256 "bc52e89265f1f65248c8e0b8484ebaab74c35788348c235536c7821fd983ad68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.2/is-it-slop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b095244ac844bb13ad976da7c769569cd9665dbf6e3f3d87f155ad671ee1299"
    end
    on_intel do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.2/is-it-slop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3e45946c65e26897dad931a9ccb5f502f9389f54e43e6463ac72a81627a2843"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/is-it-slop --version")
  end
end
