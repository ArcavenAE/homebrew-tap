# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: use install.sh or build from source.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  url "https://github.com/arcavenae/forestage/releases/download/alpha-20260413-000443-c141918/forestage-a-darwin-arm64"
  version "alpha-20260413-000443-c141918"
  sha256 "d50e50061a69e2c1fb903d1a7dc0e627ec709e77624f73904779f877525b7029"
  license "MIT"

  def install
    bin.install "forestage-a-darwin-arm64" => "forestage-a"
  end

  def caveats
    <<~EOS
      forestage-a is the alpha channel. Updates on every push to main.
      For stable: brew install arcavenae/tap/forestage
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "forestage", shell_output("#{bin}/forestage-a --version 2>&1")
  end
end
