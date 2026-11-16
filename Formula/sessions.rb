class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "a79689671b5c1561015b59262605e9e3cfa31939a0f7cac6faa10b35967619c6"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "1ae8b989a67592409fe4a40f36931b198e2812ca817227115185d652d5131f57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-arm64.tar.gz"
      sha256 "fd21bd1b69c89cc0da3436ee0462af8c6c7f94e3701fb7e60b2d6e283f2cd727"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
      sha256 "901336ce9e28066415571ce5015f8490361109c6b5016bac66ff039a9657092a"
    end
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
