class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.15/anywhered-0.1.15-darwin-arm64.tar.gz"
      sha256 "7436586dcbeb44fe14a0be32ea29e4ade998a6f52e65e5a8a1df720239d03054"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.15/anywhered-0.1.15-darwin-amd64.tar.gz"
      sha256 "90d304f740a18297a8d7928bd11fa4280a246286449934c85d00a932260f8b3f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.15/anywhered-0.1.15-linux-arm64.tar.gz"
      sha256 "a0b738557d5d446734b975e1555c7d1524bbaadf94f768410f46d33e89a0e4da"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.15/anywhered-0.1.15-linux-amd64.tar.gz"
      sha256 "55551c20ce88d2850fe3492da9ce93400d2212f3e13e6dd3ba81a6a0f69be91f"
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
      Run in the background ad-hoc:
        anywhered start | status | stop
      Pair the app:   anywhered pair | pair -6 | pair -ts
      Inbox hooks:    anywhered install-hooks
    CAVEAT
  end

  test do
    assert_match "anywhere", shell_output("#{bin}/anywhered pair 2>&1")
  end
end
