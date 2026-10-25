# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20261025-234315-316dcfd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-234315-316dcfd/forestage-a-darwin-arm64"
    sha256 "2c1125ad4b69a55339636ea94ae459b33eeb20259b14498e3f78965c250352f2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-234315-316dcfd/forestage-a-linux-arm64"
    sha256 "81c17dfb0e562fa154d71187fd8d3f08fa2a2e8634c152ec18f46d431bdee4cd"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-234315-316dcfd/forestage-a-linux-amd64"
    sha256 "d2fdf632be5816f938537374b6c81d8e817eef6a5b0dccf9c584c393236eba4f"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "forestage-a-darwin-arm64" => "forestage-a"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "forestage-a-linux-arm64" => "forestage-a"
    elsif OS.linux?
      bin.install "forestage-a-linux-amd64" => "forestage-a"
    end
  end

  def caveats
    <<~EOS
      forestage-a is the alpha channel. Updates on every push to develop.
      For stable: brew install arcavenae/tap/forestage
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "forestage", shell_output("#{bin}/forestage-a --version 2>&1")
  end
end
