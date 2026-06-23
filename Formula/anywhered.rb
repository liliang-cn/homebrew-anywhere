class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.10/anywhered-0.1.10-darwin-arm64.tar.gz"
      sha256 "f891c791586b2b7c055ddc3fa3665675dbd394fd0fba22543894bcf7667d6ea1"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.10/anywhered-0.1.10-darwin-amd64.tar.gz"
      sha256 "449354b97e71aa6faab566fe46658285c5d08e0cbfee7cb7cc8f0df4771e8b44"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.10/anywhered-0.1.10-linux-arm64.tar.gz"
      sha256 "cb29862b02d459fdf4f541597c308161b1a5aba6a66f455f66f8bf40a5d5d45b"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.10/anywhered-0.1.10-linux-amd64.tar.gz"
      sha256 "79089b631c7b4b3b355143566dad2023a0bea8aee0a2cb958bdf6fb70ee70a47"
    end
  end

  def install
    bin.install "anywhered"
  end

  def caveats
    <<~CAVEAT
      Start the daemon (binds 0.0.0.0:47823, prints a pairing QR):
        anywhered
      Pair the app:   anywhered pair | pair -6 | pair -ts
      Inbox hooks:    anywhered install-hooks
    CAVEAT
  end

  test do
    assert_match "anywhere", shell_output("#{bin}/anywhered pair 2>&1")
  end
end
