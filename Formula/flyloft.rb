# Homebrew formula for flyloft
# Updated automatically by the release workflow when signing is enabled
# macOS only (arm64). Linux users: download from GitHub releases.

class Flyloft < Formula
  desc "Curated retrieval substrate with hybrid search and a curation surface"
  homepage "https://github.com/arcavenae/flyloft"
  url "https://github.com/arcavenae/flyloft/releases/download/alpha-20260704-170412-1c11f1f/flyloft-darwin-arm64"
  version "0.0.1"
  sha256 "aa882e09d56cc15ea07846c11daa9d8edf319923071bf83cfce6f46b5c310d28"
  license "MIT"

  def install
    bin.install "flyloft-darwin-arm64" => "flyloft"
  end

  test do
    assert_match "flyloft", shell_output("#{bin}/flyloft --version 2>&1")
  end
end
