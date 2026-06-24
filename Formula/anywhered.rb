class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.14/anywhered-0.1.14-darwin-arm64.tar.gz"
      sha256 "c6430782380eb8b2165b7e276c65d09cf5ff3e973f9203886512c272979a6010"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.14/anywhered-0.1.14-darwin-amd64.tar.gz"
      sha256 "e09fd794700ed88f74da7aeb7b27a03adb9e8cdb5c86d9a9308dd17cd84e3cb9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.14/anywhered-0.1.14-linux-arm64.tar.gz"
      sha256 "85a8f951714904c45fd5f983b9e94664f07293f6665eebb317bd890a8a9a26b8"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.14/anywhered-0.1.14-linux-amd64.tar.gz"
      sha256 "6f38df156a5ca9ec5286579cb4ecf8fac8348d0eff5bdad2fa7dc368e3e72334"
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
