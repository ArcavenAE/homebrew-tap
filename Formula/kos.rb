# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/alpha-20260411-204602-7e5b4be/kos-darwin-arm64"
  version "alpha-20260411-204602-7e5b4be"
  sha256 "9b4e96d8b32ea8b7ae1b3e6ec98dbf59d2f22bd5fe213be9ac4e9ed28f4ebec4"
  license "MIT"

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
