class Anywhered < Formula
  desc "Daemon that runs and controls AI coding agents for the anywhere app"
  homepage "https://github.com/liliang-cn/anywhere"
  url "https://github.com/liliang-cn/anywhere/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "9deed5e52382f4ce833362bac3a7bfab7d9ec1dd61a803b83c415909f0ebcc9d"
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
