# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260630-020406-cc6110c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260630-020406-cc6110c/forestage-a-darwin-arm64"
    sha256 "49c4e0a6b18827737781bddd9b000ab8fabf8aaf33d48851ad207315670d066d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260630-020406-cc6110c/forestage-a-linux-arm64"
    sha256 "97512c6046022afb19a24d68574e78ae981dc2b84316556a2a003e5a98b63d0a"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260630-020406-cc6110c/forestage-a-linux-amd64"
    sha256 "0442d63873faa9cbffa072afc15ce216d228dad0749fd62b8f5d4d12098a54f9"
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
