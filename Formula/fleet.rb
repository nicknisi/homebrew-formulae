class Fleet < Formula
  desc "Agent dashboard TUI for managing AI sessions in tmux"
  homepage "https://github.com/nicknisi/fleet"
  version "0.22.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-arm64.tar.gz"
      sha256 "b640f705c2fb6d58cd0188dbc99db9fce134481365eefc7b482751dc8cc6774e"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-darwin-x86_64.tar.gz"
      sha256 "78ae09c7fe134b5c907d392a7116c1c2a4fb02cf1ac275625eb986e8d4fc746a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-arm64.tar.gz"
      sha256 "4becb68b3a17a129840a45e080cacf5285c3f1511d8ade444dc507a18d0474ef"
    else
      url "https://github.com/nicknisi/fleet/releases/download/v#{version}/fleet-linux-x86_64.tar.gz"
      sha256 "62366e0ad3b1bccf34fec8a858e3e6872b0a1e9273f46977503891b4a24b7c77"
    end
  end

  def install
    bin.install "fleet"
    prefix.install "hooks"
    prefix.install ".claude-plugin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleet --version 2>&1")
  end
end
