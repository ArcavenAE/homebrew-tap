# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260706-003726-02302a0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260706-003726-02302a0/forestage-a-darwin-arm64"
    sha256 "3a0383284ac881608ea38fa07c4ea5326126bef1f1972cfdd7ee69ab5449e72c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260706-003726-02302a0/forestage-a-linux-arm64"
    sha256 "8e3de03c2740d9bc1db6fc0fcfc478695a71bcc2f4f0e1d985d19a79ad1a2f2f"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260706-003726-02302a0/forestage-a-linux-amd64"
    sha256 "151449c579476e88a7060ac41c94d0f1e665ce2172856716772b83e72662b332"
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
