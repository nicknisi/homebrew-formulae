class Dad < Formula
  desc "GitHub PRs as narrated stories — AI-powered semantic diff review"
  homepage "https://github.com/nicknisi/diffdad"
  version "0.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-arm64.tar.gz"
      sha256 "57410823c4e0202c6625d7cd5955f131ba064f4da96a4d9ae82e4462724d407e"
    else
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-x86_64.tar.gz"
      sha256 "0c8ff1889d63e4bda5094096136902ef6ddd7a90de7f0602746c8aa3d9375100"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-linux-aarch64.tar.gz"
      sha256 "4cc772b12872ef4927b2fd2fa68130e87580b2472f9616f9a14bbea977086d42"
    else
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-linux-x86_64.tar.gz"
      sha256 "68728a0efc559d023a93910b1d2624bf310a890f131b6c333d70d1f29efb5101"
    end
  end

  def install
    bin.install "dad"
    (share/"diffdad").install "share/diffdad/web"
  end

  test do
    assert_match "dad - GitHub PRs", shell_output("#{bin}/dad --help")
  end
end
