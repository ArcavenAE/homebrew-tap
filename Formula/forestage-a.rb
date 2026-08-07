# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260807-075917-380196c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260807-075917-380196c/forestage-a-darwin-arm64"
    sha256 "a3794a65a76c443e97b933f4122b1aeedcbc96a910486c081694fce9f57fd0e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260807-075917-380196c/forestage-a-linux-arm64"
    sha256 "1a77ae0d4723bc2bb7adc63c12907b0b7f60eb73c120134b0a567686b1636226"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260807-075917-380196c/forestage-a-linux-amd64"
    sha256 "acf2ad8803c49d54c03bb577412779dfe603938c71c9064bf68e8c45aa47107b"
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
