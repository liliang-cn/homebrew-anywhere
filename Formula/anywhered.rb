class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.13/anywhered-0.1.13-darwin-arm64.tar.gz"
      sha256 "aa54b86429a2e1aa913c9da4190095269e4d50477c24d02cf3dade596984603a"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.13/anywhered-0.1.13-darwin-amd64.tar.gz"
      sha256 "a73fa457ab3ef0beb78e87f9c6f1f37b219020bdbd1a5f4a09fea67edc8ed1a9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.13/anywhered-0.1.13-linux-arm64.tar.gz"
      sha256 "89875c4ae235ecf425d50273e8a08136cf3bdb900398cb070bfd6afae8144ea3"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.13/anywhered-0.1.13-linux-amd64.tar.gz"
      sha256 "46dfd744fc902c482420163b03663fba30baaa66b20ea6d3f136a3a88d9be6d7"
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
