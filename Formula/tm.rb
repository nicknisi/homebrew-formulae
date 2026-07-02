class Tm < Formula
  desc "Grid-based tmux session switcher with live pane previews"
  homepage "https://github.com/nicknisi/tm"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-arm64.tar.gz"
      sha256 "725139d4724000dd867eeabf4b1835a6d1946cc812e87cbdd1090aa05048c034"
    else
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-x86_64.tar.gz"
      sha256 "51608d141361a0b9af7bd6a8e572b188368cd811c5b9591c8b2871137984fc09"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-linux-x86_64.tar.gz"
    sha256 "8046f2943c0e0bfa97c8a8811c54ee3463f11ceb34d320159cf76a0fc7edeb41"
  end

  def install
    bin.install "tm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tm --version 2>&1", 1)
  end
end
