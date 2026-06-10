class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "df4236c6ef0dad11e147853d8d0065ad1952d84fdad2c5b6ed61d2475b897242"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "cd3d97eddd014dffe1b264ef146b692292c10f8624069311353bc8639839e369"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
    sha256 "f32c50490d0d312be74024fa7ac9fceb87aa2e9255094e4ce6bab071438bca7c"
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
