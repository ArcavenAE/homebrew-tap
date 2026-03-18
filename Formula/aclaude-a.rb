# Homebrew formula for aclaude-a (alpha channel)
# Updated automatically by CI on every push to main

class AclaudeA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcaven/aclaude"
  version "alpha-20260318-053731-68802d9"
  license "MIT"

  on_macos do
    url "https://github.com/arcaven/aclaude/releases/download/alpha-20260318-053731-68802d9/aclaude-a-darwin-arm64"
    sha256 "d56ffee1db1ee258ed96c446d358ca861bc6d39d7d43c8945a21c433b1c6763a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/arcaven/aclaude/releases/download/alpha-20260318-053731-68802d9/aclaude-a-linux-arm64"
      sha256 "SHA256_LINUX_ARM64_PLACEHOLDER"
    else
      url "https://github.com/arcaven/aclaude/releases/download/alpha-20260318-053731-68802d9/aclaude-a-linux-amd64"
      sha256 "SHA256_LINUX_AMD64_PLACEHOLDER"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    binary = "aclaude-a-#{os}-#{cpu}"
    bin.install binary => "aclaude-a"
  end

  def caveats
    <<~EOS
      aclaude-a is the alpha channel. Updates on every push to main.
      For stable: brew install arcaven/tap/aclaude
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "aclaude", shell_output("#{bin}/aclaude-a --version 2>&1")
  end
end
