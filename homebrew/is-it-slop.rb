class IsItSlop < Formula
  desc "Detect whether text is slop"
  homepage "https://github.com/SamBroomy/is-it-slop"
  version "__VERSION__"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "__MACOS_ARM64_URL__"
      sha256 "__MACOS_ARM64_SHA256__"
    else
      odie "Intel macOS is not supported (ONNX Runtime does not provide prebuilt binaries)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "__LINUX_ARM64_URL__"
      sha256 "__LINUX_ARM64_SHA256__"
    elsif Hardware::CPU.intel?
      url "__LINUX_X86_64_URL__"
      sha256 "__LINUX_X86_64_SHA256__"
    else
      odie "Unsupported Linux architecture: #{Hardware::CPU.type}"
    end
  end

  def install
    bin.install "is-it-slop"
  end

  test do
    assert_match "is-it-slop", shell_output("#{bin}/is-it-slop --help")
  end
end
