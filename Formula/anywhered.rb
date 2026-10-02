class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the Anywhere app"
  homepage "https://github.com/liliang-cn/anywhered"
  version "0.1.20"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.20/anywhered-0.1.20-darwin-arm64.tar.gz"
      sha256 "abdf901bd60026696b210b889449ccdb941b3525fd5461c1bbdbe7a0e43db14c"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.20/anywhered-0.1.20-darwin-amd64.tar.gz"
      sha256 "11945a38791ce6920aa58e3940ad84846e94f1c049006ba28f099ed3b22ae149"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.20/anywhered-0.1.20-linux-arm64.tar.gz"
      sha256 "ec00559c43b14937e25194ea23a342ca167a5385d20b7d0c1273ef03e68dead4"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.20/anywhered-0.1.20-linux-amd64.tar.gz"
      sha256 "12ca6877ae2d4569242e37cf214ec797cb0c2697afb4091fea9d33aa07b12b7c"
    end
  end
  def install
    bin.install "anywhered"
  end
  test do
    assert_match "anywhere", shell_output("#{bin}/anywhered pair 2>&1")
  end
end
