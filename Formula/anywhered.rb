class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.16/anywhered-0.1.16-darwin-arm64.tar.gz"
      sha256 "98d36e9df2b72b4a2b334fb8ff44c380d4f24428834abf986b5d8f494b43ded9"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.16/anywhered-0.1.16-darwin-amd64.tar.gz"
      sha256 "08c613aca5ccd6b16dcba5a5c63c58672aa7a32f0fd25271c1d811ee2195f047"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.16/anywhered-0.1.16-linux-arm64.tar.gz"
      sha256 "1b76319794c3f2ff7fc652b4fd5aa42b0e934eec180972eb3681e43c6ee67ec7"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.16/anywhered-0.1.16-linux-amd64.tar.gz"
      sha256 "5a3430eff8a7d670f116667a20d832ac7fed3bd14252706fcaa53859cd45fcb0"
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
