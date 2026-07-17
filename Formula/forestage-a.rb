# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260717-200543-fcd7e8f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260717-200543-fcd7e8f/forestage-a-darwin-arm64"
    sha256 "35dfaf2cb9c93df6a4f374f5a29c13f2f0cb069f1e7e24697402312c384f1e1d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260717-200543-fcd7e8f/forestage-a-linux-arm64"
    sha256 "fc0daeecc991b50c4f9301ef2d945c2d4033c1b0761ba95db2251426114655cf"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260717-200543-fcd7e8f/forestage-a-linux-amd64"
    sha256 "9b3d4d6fc7f3a4e872d7f9c5e869a552026cf5dd4696e409f4a7db29d36bd6d0"
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
