# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260706-015401-7cb1a87"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260706-015401-7cb1a87/forestage-a-darwin-arm64"
    sha256 "df744a88d396be718dc46ed0b44e5ba507f562fd80f929a267d706536f491ee2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260706-015401-7cb1a87/forestage-a-linux-arm64"
    sha256 "84fd7b63c3992d6573603b2b86a461e7b15b816d485cd7bb75ff14c4047f82d6"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260706-015401-7cb1a87/forestage-a-linux-amd64"
    sha256 "002296e81d5d1b831c38b860dceae85cd1532a7ce8da43eb4c8c586567f0cd5c"
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
