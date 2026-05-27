class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "2f7ecd42abe2f78819cd6d512cf72871d2b83c17bbf355da26981c2ea0d2c12b"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "3c88770ae629919b0fb67e3c5d998ee12ee69dc4df4ece66765ebb0309c02579"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
    sha256 "bc60211dcca32687923d976d2c128cfc2ccd9c11b34eb66865ce3b561dd8746c"
  end

  def install
    bin.install "fleet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleet --version 2>&1", 1)
  end
end
