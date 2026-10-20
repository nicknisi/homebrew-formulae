class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "faf094f9fd4441a502e089a5d000562cd2e5a15a12393c286b86144c66ddabab"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "8893317e041eb427d42f61dcef1fe2c8dbca4beff773e0e18bf945688a8cee5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-arm64.tar.gz"
      sha256 "5d149e29764f26110e5d237f89f1838c66195cf42aa6b2bb6446c40d71846480"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
      sha256 "7930d0f9613b607f93a124475af762f45b01f8114b362f2206cca23a1812b59b"
    end
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
