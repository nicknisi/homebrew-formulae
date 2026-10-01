class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "f740d9bd71ed3c446bb6233fabab492d09787d5f3ad49af6a65eb88e5a206916"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "da0b3934a2044adfd44abf7c0b030c1ea472e24c56570ecf66995f88fec4ab7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-arm64.tar.gz"
      sha256 "6bb07de95493bdb4f91ffa096ea8c00f1ebb53143e50827df9d57a893f93762f"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
      sha256 "7de965ed23d30cdc08078b6811fa7252bba7eeff002b6ca8d07c490b3ff7641e"
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
