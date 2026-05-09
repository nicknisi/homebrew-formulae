class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_arm64"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_x86_64"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
    sha256 "PLACEHOLDER_linux"
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
