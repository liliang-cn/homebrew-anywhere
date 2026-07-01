class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  version "0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.17/anywhered-0.1.17-darwin-arm64.tar.gz"
      sha256 "3aded022509b1dbf931f4d00df9b0e08d27adf79857c2de09a131a79409fe5e5"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.17/anywhered-0.1.17-darwin-amd64.tar.gz"
      sha256 "79c44e49cce17df45df0e3fda304942da16c469877264505e40ef97241f1233a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.17/anywhered-0.1.17-linux-arm64.tar.gz"
      sha256 "fb93766b5788ecd30d41a197231e1509af97f2f09ad8aff488059cf64a9399c9"
    end
    on_intel do
      url "https://github.com/liliang-cn/anywhere/releases/download/v0.1.17/anywhered-0.1.17-linux-amd64.tar.gz"
      sha256 "b72a683e80a8e59c2fb4c567bdb23d79a7c4135859dc970339b5ab568ae46f8c"
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
