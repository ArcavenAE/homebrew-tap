# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260422-180039-6b410a2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260422-180039-6b410a2/forestage-a-darwin-arm64"
    sha256 "3f5f3e1dc2ed36d6c7849a7e9f4b85eef0d28f00a98dfb2b5b63de94bab8751f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260422-180039-6b410a2/forestage-a-linux-arm64"
    sha256 "91e435292068d95230dfc44922f4bbd39d809040e0765715472c14f3bfadba98"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260422-180039-6b410a2/forestage-a-linux-amd64"
    sha256 "78890356ba2113e2fb1676047f8b6d34ec0c032ffbf41fdf98602ca61403fdab"
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
