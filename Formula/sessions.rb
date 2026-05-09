class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "70343fa2ba40aa5ecf02f8073a8dd2a07a7008836f0e8480f7d020f1ddc546c3"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "710febd3da0380903414a013f51e31f37cfcc50fe92bec1b67fe7fc1a5643803"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
    sha256 "cdb81a651c3bbc38a004674200ed13a190536089e8d61a025cd564718a36cd7e"
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
