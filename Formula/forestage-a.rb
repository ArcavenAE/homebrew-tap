# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260419-044142-a67c56f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-044142-a67c56f/forestage-a-darwin-arm64"
    sha256 "70373d0526ec848bf41236fe47ed4d2176b5be749378d8e6607785973593a769"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-044142-a67c56f/forestage-a-linux-arm64"
    sha256 "9705267784a8166231a6ae6c5d40f3aba528cd8b1302ec79b58ccc1932e5cd3c"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-044142-a67c56f/forestage-a-linux-amd64"
    sha256 "155a4661706f82e2f3caa8b1e6d74a8c524c58bd921a95e89ccba61b29901326"
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
