class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.18/anywhered-0.1.18-darwin-arm64.tar.gz"
      sha256 "1683ba8392f19bf2e7c4d75bd7a33475a64488c93b931d751d9f28d484943245"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.18/anywhered-0.1.18-darwin-amd64.tar.gz"
      sha256 "9d7d51d11f226d8c11b0b89896f14b75e1284067710e834c35142089904e2522"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.18/anywhered-0.1.18-linux-arm64.tar.gz"
      sha256 "c98b8154eddde7287f8949ea8ffdd3b3d1be26fe87dc3be27f3fad0a750f7845"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.18/anywhered-0.1.18-linux-amd64.tar.gz"
      sha256 "c1c4f14cc8d4a8ff959ec6163b740a41ec15f4e401936f8af62117d1b9de8088"
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
