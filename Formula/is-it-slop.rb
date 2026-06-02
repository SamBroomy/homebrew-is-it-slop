class IsItSlop < Formula
  desc "Detect AI-generated text"
  homepage "https://github.com/SamBroomy/is-it-slop"
  license "MIT"
  version "0.6.3"

  on_macos do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.3/is-it-slop-aarch64-apple-darwin.tar.gz"
      sha256 "1ad99ba5ad971d40a4432cad450d928a1b12c758fdae4a2f7b74f3ea59039c4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.3/is-it-slop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "618da7a352707330b411449e9dfc45414faf754e9eb720ea66eb0dee49de3083"
    end
    on_intel do
      url "https://github.com/SamBroomy/is-it-slop/releases/download/v0.6.3/is-it-slop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e09d9833bf76d8700e0b31370b9b8e5859cfeac7e8c704238f2c191163a11fc8"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/is-it-slop --version")
  end
end
