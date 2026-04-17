# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260417-224905-1e350a7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-224905-1e350a7/forestage-a-darwin-arm64"
    sha256 "646e7e3daf5316278b38a48724100f0e223e1e5434461a7c2ef13bce16a6826e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-224905-1e350a7/forestage-a-linux-arm64"
    sha256 "52998d7c5b696fea9888e0e9422c88ca0c6e4c75337e3d4740355121b58b485f"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-224905-1e350a7/forestage-a-linux-amd64"
    sha256 "621372596c600771e57e91c610e82aeedd6b9037eeca5b40965d4e10a0b39580"
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
