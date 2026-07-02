class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the Anywhere app"
  homepage "https://github.com/liliang-cn/anywhered"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.18/anywhered-0.1.18-darwin-arm64.tar.gz"
      sha256 "4690aa47137d16bfb130c67c6a4507b7236edd44486245d57f2430ef134707a8"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.18/anywhered-0.1.18-darwin-amd64.tar.gz"
      sha256 "0605b4c8f9a8097113127df0381c590b3ffe6accb71673f64f9e4d68be3cd2f0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.18/anywhered-0.1.18-linux-arm64.tar.gz"
      sha256 "63c19fce33ba8d0dcd7e7d66381a12034b0599622dc12018309a3be318cbe2ea"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhered/releases/download/v0.1.18/anywhered-0.1.18-linux-amd64.tar.gz"
      sha256 "74f4591de36c1517df264c65cc4788fa812762ad7ca9586498821cc52d41a199"
    end
  end

  def install
    bin.install "anywhered"
  end

  def caveats
    <<~CAVEAT
      Start the daemon (binds 0.0.0.0:47823, prints a pairing QR):
        anywhered
      Keep it always on (start at boot + auto-restart):
        anywhered service install
      Pair the app:   anywhered pair | pair -6 | pair -ts
      Inbox hooks:    anywhered install-hooks
    CAVEAT
  end

  test do
    assert_match "anywhere", shell_output("#{bin}/anywhered pair 2>&1")
  end
end
