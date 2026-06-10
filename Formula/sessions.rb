class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "e09ded51b2d8b9c4559cb0b8085043b3934ce202daa035777e571878eb18878e"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "8697b861110d214c147a699119649e00f2a1318e4b5428c8ef7fd6ee4cd6038a"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
    sha256 "638bbc790ebc371f475cd5fcf1e803bf6952cc6182d85cc3a07140ef164e4ea1"
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
