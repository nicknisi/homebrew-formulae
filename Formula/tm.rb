class Tm < Formula
  desc "Grid-based tmux session switcher with live pane previews"
  homepage "https://github.com/nicknisi/tm"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-arm64.tar.gz"
      sha256 "9baccce27e6cd4f5bd026181a94f1aecf7d1367e34c29e17821e76c3d2ca9fa0"
    else
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-x86_64.tar.gz"
      sha256 "9aad96958bd35653dbaef9f3fc96dff0856b66767816b9a9d153d682207026c1"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-linux-x86_64.tar.gz"
    sha256 "3d8845445a1b814822525311cb5d986a0853de8bfc2235e62e1f299ef6dfa872"
  end

  def install
    bin.install "tm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tm --version 2>&1", 1)
  end
end
