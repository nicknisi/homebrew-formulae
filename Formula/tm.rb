class Tm < Formula
  desc "Grid-based tmux session switcher with live pane previews"
  homepage "https://github.com/nicknisi/tm"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-arm64.tar.gz"
      sha256 "65f8d78efe42734875401ab960bef8dc568b7208a2b744c8426468094c6238ea"
    else
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-x86_64.tar.gz"
      sha256 "cf7cf0491167eee330adc77293b5609c9d1c9c3e5be33097231f48c96205dd30"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-linux-x86_64.tar.gz"
    sha256 "dfdd906bc5359a85a7139890550a3defd859212fa5c03a96f486986389bdc9ac"
  end

  def install
    bin.install "tm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tm --version 2>&1", 1)
  end
end
