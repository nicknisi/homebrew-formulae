class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.28.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "0bc1c7edfca69f788a0045dbcb1786398fe47041fe49724fef79eeb5b10f36d1"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "5bd905822b45696cad0983b974643939360b67a6787c37ea0c49b22448d7f298"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-arm64.tar.gz"
      sha256 "6c5204a8c1e234c2dea57e7795e0d20a0e05e0adc85f97b5fcf970ff32d04a12"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
      sha256 "ebf1e1838113cd5235b246d9cec54e7ff51e7444079e7c65493708da5e3b8be6"
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
