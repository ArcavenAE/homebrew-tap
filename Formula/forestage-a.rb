# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260419-042535-4b4c45c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-042535-4b4c45c/forestage-a-darwin-arm64"
    sha256 "8985b7b401c49c5a7444d07c6d2c309b3728ba454a825f8ba35b36de17fdb6df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-042535-4b4c45c/forestage-a-linux-arm64"
    sha256 "53f8f3683298d45ee045e53a383f0c09a32d5464c82359dbd105f83ee0c2ac20"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-042535-4b4c45c/forestage-a-linux-amd64"
    sha256 "5f5b826d87554ed018832c1738021bc2f638958296daf04ba060e67cafac0335"
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
