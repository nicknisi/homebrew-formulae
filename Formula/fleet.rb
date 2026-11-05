class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "c83d5c995890444f219599b2c5263ecc275d84c835c50249c3acf2ac0aa206d9"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "04c47690c98dfc4dc56f92f437b515a199889b16090fd95bc8bcda9d863a6cb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-arm64.tar.gz"
      sha256 "9bf1196d69ba5fddca5fae57b0fe398bbaf83476b87b3f97ac78e925fbda490e"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
      sha256 "ade7499e043e816c02ff657d060ce449b73a530dc825b173b67b509464e2e6c5"
    end
  end

  def install
    bin.install "fleet"
    prefix.install "hooks"
    prefix.install ".claude-plugin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleet --version 2>&1")
  end
end
