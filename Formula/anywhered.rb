class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  url "https://github.com/liliang-cn/anywhere/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "08ee485065672c587ca5257ce129597278105e4335e7530fbacbbc059858d21f"
  license "MIT"
  head "https://github.com/liliang-cn/anywhere.git", branch: "main"

  depends_on "go" => :build

  def install
    cd "anywhered" do
      system "go", "build", "-trimpath", "-ldflags", "-s -w",
             "-o", bin/"anywhered", "./cmd/anywhered"
    end
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
