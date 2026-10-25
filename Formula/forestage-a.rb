# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20261025-153546-b266ede"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-153546-b266ede/forestage-a-darwin-arm64"
    sha256 "1ee1c6af3d47b5185560d51ddff43ac85b8069e46a3df159d5eccc48d2a8ff6a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-153546-b266ede/forestage-a-linux-arm64"
    sha256 "ae053b5f8f6d4c11e8803b5c07ffdef8f1705f6381ad5a8b5d0dc8b770cd5084"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20261025-153546-b266ede/forestage-a-linux-amd64"
    sha256 "9f63bab9b0ca81e1047175cab55ca446cb0bff05eacdf829d07f282b255c4a0e"
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
