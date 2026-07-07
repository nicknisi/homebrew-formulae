class Dad < Formula
  desc "GitHub PRs as narrated stories — AI-powered semantic diff review"
  homepage "https://github.com/nicknisi/diffdad"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-arm64.tar.gz"
      sha256 "a5d6dd62a75f01ba74c110baaea8f4009b60fb32e2b3e73be2958b1b13c8600d"
    else
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-x86_64.tar.gz"
      sha256 "d50293964142ed6d6007ad0ec7aea2260ee17aa13795ee8b5d27548632ce7b7f"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-linux-x86_64.tar.gz"
    sha256 "3b60b05046c14ffa49cca9d0ddc6358bc2dc954393b079f4b8eabd849366e9ae"
  end

  def install
    bin.install "dad"
    (share/"diffdad").install "share/diffdad/web"
  end

  test do
    assert_match "dad - GitHub PRs", shell_output("#{bin}/dad --help")
  end
end
