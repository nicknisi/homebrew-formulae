class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.29.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "fc87ada497cf60f9cf0dfbc0e6acd3ed1c1c643400497dcb4a5e0065328306cf"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "5a36fb65af3eb25eaf287e7e1dc3ea1ffd7341294d1641b506caf97e1f18bb36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-arm64.tar.gz"
      sha256 "0e18eae7924228918deac6b8d1050b1f730683bef06280a3a3cdb42b0ef41eb3"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
      sha256 "e049d0a7bfde3d237e41596d3f2ed94db336ba8562abed40a22f71067d5cd84a"
    end
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
