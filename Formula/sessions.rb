class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "7c1c21ce3ab3beb6a866670ff57920309690dec973794697731f08b6a2c01239"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "926d24e7e6531f555a261e2ddf10fc88a42df928a44c1f5a6aeb878445154234"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-arm64.tar.gz"
      sha256 "2a37239f593f19af0bd57ac0edac0504cd2a6935a2e1f54852269792efeba668"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
      sha256 "352b12d8cb785e6d6609b13949d8dddb79ac2117077b81fef80e415e1169f4b2"
    end
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
