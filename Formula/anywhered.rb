class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the Anywhere app"
  homepage "https://github.com/liliang-cn/anywhered"
  version "0.1.21"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.21/anywhered-0.1.21-darwin-arm64.tar.gz"
      sha256 "76755aaf2c02a08d878d04234fa34fdee6fb2dcac3dc48f9c74dac7ab73c00e1"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.21/anywhered-0.1.21-darwin-amd64.tar.gz"
      sha256 "a0ddd490874f18e7e92bfd61c314c2916abddec16af9701b2b92717137e875be"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.21/anywhered-0.1.21-linux-arm64.tar.gz"
      sha256 "e8badb73048b84327ec057f51a7e146f9ca4c0444fea716505dca321f86ad9a4"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.21/anywhered-0.1.21-linux-amd64.tar.gz"
      sha256 "7acbe11ab6bc5c3c41fc87709536f9b2377e9a24e8f318e2281eb2c266556ec1"
    end
  end
  def install
    bin.install "anywhered"
  end
  test do
    assert_match "anywhere", shell_output("#{bin}/anywhered pair 2>&1")
  end
end
