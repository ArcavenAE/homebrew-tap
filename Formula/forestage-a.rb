# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20261025-181143-58b022c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-181143-58b022c/forestage-a-darwin-arm64"
    sha256 "d2b503afdb9ebb160a36b9f8c8db01faf5a0525ddd0bf37933aa8d5890f11b85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-181143-58b022c/forestage-a-linux-arm64"
    sha256 "ee9524ac34276b0847dfa671be66d9d836d8d648dab8ceaa0853cd58d9166a25"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-181143-58b022c/forestage-a-linux-amd64"
    sha256 "70a9f0f927080571f1df32e41310a3d78ed72f0423c5d0fe1ca40b7df1fd95af"
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
