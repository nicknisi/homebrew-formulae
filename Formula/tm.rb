class Tm < Formula
  desc "Grid-based tmux session switcher with live pane previews"
  homepage "https://github.com/nicknisi/tm"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-arm64.tar.gz"
      sha256 "269f441671365a1147bd485c3af2bc75883c7501ffc98a27c6e6b4bd8b4b9f22"
    else
      url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-darwin-x86_64.tar.gz"
      sha256 "8def2a3d9101b5773d4f7b7c8798d7c452c4e8183fbc044380a49a4792c5e821"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/tm/releases/download/v#{version}/tm-linux-x86_64.tar.gz"
    sha256 "8c8823b7b71f418ae38bf89d4ae3759f814ed801a5f8c558e6a83062c9e53a69"
  end

  def install
    bin.install "tm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tm --version 2>&1", 1)
  end
end
