class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "90741fd14547fd3daa987e5b3fc0dbe334f95ba8f9d58bfa54ff40c09f8414b3"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "6c20fa9104663c9f14fe0f4d1cf72525f2b860db3bdf283298275a7f1d0b65b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-arm64.tar.gz"
      sha256 "69b895e54e62e70f7fffcf3fdfaa667455bdc490952884d213dbcbf2169c90c1"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
      sha256 "0202dc03dae642d74921f701344d5c59f21171cac457ce5fb519ccdcad6b506f"
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
