# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Knowledge Operating System — graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/main-20260405-052902-00bd93c/kos-darwin-arm64"
  version "main-20260405-052902-00bd93c"
  sha256 "1de411402ac253f43a6c7b6ac070e91145052c11c3acef8b5c9a0763e04b7037"
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
