# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260626-140828-353950c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260626-140828-353950c/forestage-a-darwin-arm64"
    sha256 "f7d2fde5c672016af52e10bedffaac3dbd7b4c5ea9b4676cc6c1910cd37c9ce4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260626-140828-353950c/forestage-a-linux-arm64"
    sha256 "ff9d84ba1860dae668458c07ed74b97c194473b785656f569a004f878efa39dd"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260626-140828-353950c/forestage-a-linux-amd64"
    sha256 "ce7d99485ce61af439fa99507770cd51f6b6709f74c114d8e7ace3a6e623a67e"
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
