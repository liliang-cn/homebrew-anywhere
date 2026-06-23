class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.11/anywhered-0.1.11-darwin-arm64.tar.gz"
      sha256 "7385fdb5c40564533d514b58b6b17d405067b14b7d1d058cd0423e4fa0ee8787"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.11/anywhered-0.1.11-darwin-amd64.tar.gz"
      sha256 "0789df7e30e8115995314e04f4c16a62e62d7f261090a64bae3bd0bde0f1bd53"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.11/anywhered-0.1.11-linux-arm64.tar.gz"
      sha256 "04b8a80b53e253ae642ce0c2dfa64f826dabfd0f4fab92833945ae34a96d446e"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.11/anywhered-0.1.11-linux-amd64.tar.gz"
      sha256 "b830a0e342b00fbfa06e527685062c88e6d3021efc87b7f3aeb0b1960e65556c"
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
