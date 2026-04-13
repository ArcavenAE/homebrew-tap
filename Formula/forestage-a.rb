# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: use install.sh or build from source.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  url "https://github.com/arcavenae/forestage/releases/download/alpha-20260413-072720-2d6ee07/forestage-a-darwin-arm64"
  version "alpha-20260413-072720-2d6ee07"
  sha256 "a22a508b9f43440d404b40379695dca8a04a04970a3687036f57d13ec3657d75"
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
