# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Knowledge Operating System — graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/alpha-20260411-165600-e930d18/kos-darwin-arm64"
  version "alpha-20260411-165600-e930d18"
  sha256 "1fce56e9ca52359c7c1afaa673d2a42ca488cb4a188c46e39883fcd312a36055"
  license "Apache-2.0"

  def install
    bin.install "kos-darwin-arm64" => "kos"
  end

  def caveats
    <<~EOS
      kos updates on every push to main.
      Self-update: kos update
    EOS
  end

  test do
    assert_match "kos", shell_output("#{bin}/kos --version 2>&1")
  end
end
