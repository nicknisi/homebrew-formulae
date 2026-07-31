class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "d920194068612b1f6aaf225772e2526825009c9831bc9481a153c3ee2eb38a1f"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "baf89a5c2a0d8ce38587246ca14e30b0bd962ee9151257b8975dbfd86371d14d"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
    sha256 "a3dc5704723a38a709bfc6edfdceb61886704d092fbe61b5e2cbedf2d41ce9bb"
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
