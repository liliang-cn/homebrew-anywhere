class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  url "https://github.com/liliang-cn/anywhere/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "d78db40a21ab3089ca1f37b9d75da7dfbeb13dc596d0bdf46bf4e930ba85d1e7"
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
