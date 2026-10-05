# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20261005-234834-97e7909"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261005-234834-97e7909/forestage-a-darwin-arm64"
    sha256 "baf7a937d2562387120aff9da4decfca4da0be62f0d92d0b6ac29764db40729d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261005-234834-97e7909/forestage-a-linux-arm64"
    sha256 "d87e121d947645405273c6a594b66673266dddd0bd185c948b45542870066656"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261005-234834-97e7909/forestage-a-linux-amd64"
    sha256 "e45c2d300a509ae8304d32470b1a061304a764a63dc055b02b2ad5bf87a78eda"
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
