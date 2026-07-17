# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260717-234741-5b6665f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260717-234741-5b6665f/forestage-a-darwin-arm64"
    sha256 "994f81ce92fcf5931564c1fe22c9ca822e5857599f61261fc8c5753c67f83c5c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260717-234741-5b6665f/forestage-a-linux-arm64"
    sha256 "364118e1fcb3bc8b37cecd913107bde12f52c886658bf6527c7ea950ef661b58"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260717-234741-5b6665f/forestage-a-linux-amd64"
    sha256 "cd16a56d719ff9242df2d806abadb9b7059839be5600541603381a2e3c9a25da"
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
