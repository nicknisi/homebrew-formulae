class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "a4ced1fcfd792f0bef35fccaee20882c4e3d628e740ff5dd7c8ee53d94872061"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "05d0e7da7c8df2d17f220aeabe4a71b9d0e02ea3f693b56359d5cdff244c4220"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-arm64.tar.gz"
      sha256 "f3aea5019e2bf7273af2ff6ae8e796e305c4efd79e98b3d55740df72e2bf065b"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
      sha256 "6cce75abcdaefc5a3d19c3b5e0c19be6217d70e2f3cc6677832db84a25a7b762"
    end
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
