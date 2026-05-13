# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260513-122154-b5d2a12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260513-122154-b5d2a12/forestage-a-darwin-arm64"
    sha256 "e1803d75b268b5484c0cd70bec1de98a49c6ed292861128d4f21a35be9f3dcab"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260513-122154-b5d2a12/forestage-a-linux-arm64"
    sha256 "6075125556d31c14a4416c24fa147685ae481b73352703d42f0ec55c91e8536d"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260513-122154-b5d2a12/forestage-a-linux-amd64"
    sha256 "0ec731836e60459c089b967119553c47e1ad70ec165b5802cd4e067e6fde7b6e"
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
