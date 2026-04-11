# Homebrew formula for aclaude-a (alpha channel)
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: use install.sh or build from source.

class AclaudeA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/aclaude"
  url "https://github.com/arcavenae/aclaude/releases/download/alpha-20260411-051115-5a5e13c/aclaude-a-darwin-arm64"
  version "alpha-20260411-051115-5a5e13c"
  sha256 "27416a5a73951b2bde7400819e758dc2124bf6417c1cbc7be476559e80abe482"
  license "MIT"

  def install
    bin.install "aclaude-a-darwin-arm64" => "aclaude-a"
  end

  def caveats
    <<~EOS
      aclaude-a is the alpha channel. Updates on every push to main.
      For stable: brew install arcavenae/tap/aclaude
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "aclaude", shell_output("#{bin}/aclaude-a --version 2>&1")
  end
end
