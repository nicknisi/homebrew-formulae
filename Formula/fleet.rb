class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "45d17060232e44427f793a16c59c96d49a5ad99709fa806845425d676ae90963"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "3c37a58defaf09f6d26530e74a3015860dc4046163ef2367ef363664f6d10461"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
    sha256 "9b6d8ada6238ce9905c1e1a4128aa93ae772f9ade96557d79ab8236c857e8a52"
  end

  def install
    bin.install "fleet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleet --version 2>&1", 1)
  end
end
