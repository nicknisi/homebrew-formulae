class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "97de4a07ea2e07062b085ef8e0879e441a7c6d521e4000cfa3a44ee88943d4a4"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "dcba6b4e18852762d3c5e07b4702e53838f11078d80771421c7bd67fb154c85d"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
    sha256 "7719bc7e4e68823f4d0efe9fdb90186cf8ebb6e63f43615be588802ad0eae411"
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
