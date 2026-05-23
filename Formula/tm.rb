class Tm < Formula
  desc "Grid-based tmux session switcher with live pane previews"
  homepage "https://github.com/nicknisi/tm"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-arm64.tar.gz"
      sha256 "67aa5452e8e491ce279df40fd356e0f416fccf97f0c45d9e15bfb309cbd9e159"
    else
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-x86_64.tar.gz"
      sha256 "634c3bad150086b47efc372845573027734bfc9d4aeb5e22709a2c221d285771"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-linux-x86_64.tar.gz"
    sha256 "f386b0702ec369fe3adde6d5c2b06022809828888eb78088ce6e0d9beb1e04eb"
  end

  def install
    bin.install "tm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tm --version 2>&1", 1)
  end
end
