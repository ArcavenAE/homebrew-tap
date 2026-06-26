# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260626-155507-68c4703"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260626-155507-68c4703/forestage-a-darwin-arm64"
    sha256 "cf0e8d27fdbaac788281b0af4cf9cf3fe1738d122c86dbe3b6e1a714d801696d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260626-155507-68c4703/forestage-a-linux-arm64"
    sha256 "4a4653c4a6912895e63c4e110111d7d0452d83834d05bbde0e849c93e51f5e7e"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260626-155507-68c4703/forestage-a-linux-amd64"
    sha256 "7134b8b9561cc359e28041209c8838b44fce624ce28e892b2192c9faba355759"
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
