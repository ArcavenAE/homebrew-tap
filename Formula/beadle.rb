# Homebrew formula for beadle
# Updated automatically by the release workflow when signing is enabled
# macOS only (arm64). Linux users: download from GitHub releases.

class Beadle < Formula
  desc "Intent-aligned issue triage and dashboard for orchestrator targets"
  homepage "https://github.com/arcavenae/beadle"
  url "https://github.com/arcavenae/beadle/releases/download/alpha-20260704-170413-ef49967/beadle-darwin-arm64"
  version "0.1.0"
  sha256 "131cc2a02ea7447edf322a39c2fa7396ff629cc1a35b228b1ee95562c2dbc0ee"
  license "MIT"

  def install
    bin.install "beadle-darwin-arm64" => "beadle"
  end

  test do
    assert_match "beadle", shell_output("#{bin}/beadle --version 2>&1")
  end
end
