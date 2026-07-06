class Dad < Formula
  desc "GitHub PRs as narrated stories — AI-powered semantic diff review"
  homepage "https://github.com/nicknisi/diffdad"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-arm64.tar.gz"
      sha256 "fa6abb8636d7bb4f7d1eb9a37e4da25e1f15dc2fa500fd51168ed128941e4250"
    else
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-x86_64.tar.gz"
      sha256 "1071bd68e8a9a6a4097fd46f977d989df956aac131a20e80b1e765e66b064389"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-linux-x86_64.tar.gz"
    sha256 "9b2b35a254c226c1d15efa429cb154b9da901b37455e8d02a1bb294116e2d790"
  end

  def install
    bin.install "dad"
    (share/"diffdad").install "share/diffdad/web"
  end

  test do
    assert_match "dad - GitHub PRs", shell_output("#{bin}/dad --help")
  end
end
