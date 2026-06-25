# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260625-213503-0d4c436"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260625-213503-0d4c436/forestage-a-darwin-arm64"
    sha256 "3b648f54b7953c982170593c41743466a0c2f46b28f42e176a9d1b5fd1e5247a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260625-213503-0d4c436/forestage-a-linux-arm64"
    sha256 "6bf1527882bb4e71248cb5b5e3f27bb531148e1a44a99a5abfa064c3318774b8"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260625-213503-0d4c436/forestage-a-linux-amd64"
    sha256 "f239449f372ebe124e9663b6c27870d9352f0ac6abdbb991ddfae31041c92492"
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
