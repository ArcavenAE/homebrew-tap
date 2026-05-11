# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260511-165745-d393de5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260511-165745-d393de5/forestage-a-darwin-arm64"
    sha256 "7363d8e089751f36e62b30f028d7db944ac3b4693761815dbe0fb250dba02d33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260511-165745-d393de5/forestage-a-linux-arm64"
    sha256 "07e04b391f3071841b63c6edd7c34645d634d8978b5aecf0f0f6f903ef85e710"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260511-165745-d393de5/forestage-a-linux-amd64"
    sha256 "6c7441dd40c0034e318d4384c0d8fa68f3a8e3daf31a524b4c4bcbf8dc77a711"
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
