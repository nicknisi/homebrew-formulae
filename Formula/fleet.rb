class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "b67a19110ad565784114b4111fc0e3009e325662630d72311a83a01c47987ba3"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "24fbb2c367df4fd6533905d9c77c506ececcfb5b32ac0d13bef33b81e129d191"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
    sha256 "5cc84196bf25bf97a50771d184f0f4ef7d5907cef31e464d0c8839b1c593fd29"
  end

  def install
    bin.install "fleet"
    prefix.install "hooks"
    prefix.install ".claude-plugin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleet --version 2>&1", 1)
  end
end
