# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260419-063016-10569a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-063016-10569a8/forestage-a-darwin-arm64"
    sha256 "a3462d060b6cdf7fc39a4943328021661dc75bf828f611a5d68270c009d7dec1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-063016-10569a8/forestage-a-linux-arm64"
    sha256 "6a71d69768a8ace59b06ffd7493c43dccaa191c5501a3115600bf0e9be0c9fb5"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-063016-10569a8/forestage-a-linux-amd64"
    sha256 "f8feafec250b9642496142eab32150781fdaca126c323f9a7d32a0d7f165152f"
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
