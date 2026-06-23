class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.12/anywhered-0.1.12-darwin-arm64.tar.gz"
      sha256 "3724956f20edd50f0ff23ce445353e55724f1bafe07bd3e6f9dab13b97fc60ca"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.12/anywhered-0.1.12-darwin-amd64.tar.gz"
      sha256 "eb9f1d70029f045b7ebd4add4a4273d9389f88fd0b61775dc52266250f7bd2fd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.12/anywhered-0.1.12-linux-arm64.tar.gz"
      sha256 "bb92cf95f4f8106e0e97cf7800114ef2f934ebe2d6bf50c00701dc5f7f539744"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.12/anywhered-0.1.12-linux-amd64.tar.gz"
      sha256 "d7e795f23900e6394ce92d5e235c242b31b56e9a95d4dbbf8c1408b252349edf"
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
