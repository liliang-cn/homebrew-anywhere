class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the Anywhere app"
  homepage "https://github.com/liliang-cn/anywhered"
  version "0.1.19"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.19/anywhered-0.1.19-darwin-arm64.tar.gz"
      sha256 "f6e29e0670779798227c1b07264a10a0ffe0d15a73d56c13791bc97dab84a0a6"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.19/anywhered-0.1.19-darwin-amd64.tar.gz"
      sha256 "d801fc776f956d906afa067d07485b6d8a6b9994d99375f79b3530fe6653a193"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.19/anywhered-0.1.19-linux-arm64.tar.gz"
      sha256 "613f2b3536a5d56eb9538830636d1b837a29265a15c1a2b88fb08cc1c15a92a1"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.19/anywhered-0.1.19-linux-amd64.tar.gz"
      sha256 "26332d0a0a69eb099eafe978406ac4c62576bbbc160f2cd65819d4f52e71c4fa"
    end
  end
  def install
    bin.install "anywhered"
  end
  test do
    assert_match "anywhere", shell_output("#{bin}/anywhered pair 2>&1")
  end
end
