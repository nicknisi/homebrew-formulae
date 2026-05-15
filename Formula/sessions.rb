class Sessions < Formula
  desc "Find and resume AI coding sessions (Claude Code, Codex, Pi)"
  homepage "https://github.com/nicknisi/sessions"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-arm64.tar.gz"
      sha256 "bff97389dd899920704e7f24124025d0ca6a1cac4158e1b1db97783a213215f8"
    else
      url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-darwin-x86_64.tar.gz"
      sha256 "68dce5c888cd4447b3f06eba7bc81f5720488f4846a9e37920f3a5f31fb45b30"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/sessions/releases/download/v#{version}/sessions-linux-x86_64.tar.gz"
    sha256 "fc70e67af5f1bf8ae0531e7d9fa79a344f0d1b296168a472aab8b1efefa3ddc0"
  end

  def install
    bin.install "sessions"
  end

  test do
    assert_match "sessions", shell_output("#{bin}/sessions --help")
  end
end
