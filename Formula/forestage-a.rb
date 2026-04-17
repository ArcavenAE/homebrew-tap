# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260417-221154-aa12331"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-221154-aa12331/forestage-a-darwin-arm64"
    sha256 "90cbe0e4957646acff5817c5c2b18a0d32a8252c46c550ffe0e285b17c814094"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-221154-aa12331/forestage-a-linux-arm64"
    sha256 "d966623f9177fbca89b52896e6ec16fe3c5383827098043f34490fac11ae9787"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-221154-aa12331/forestage-a-linux-amd64"
    sha256 "de02ae1c45d9c07a7266a710e86e5ab8e21bd76a1236be569a8db255608617cd"
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
