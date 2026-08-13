# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260813-092311-9fc9f69"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260813-092311-9fc9f69/forestage-a-darwin-arm64"
    sha256 "2d61a4bf3963c0e72f4a451097fda7ebc6984032814ca3c53f9932096d932798"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260813-092311-9fc9f69/forestage-a-linux-arm64"
    sha256 "2706cfcb8597ff48f45911edcf09bd4279b5eaed9ff7e2e94737585c4154260f"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260813-092311-9fc9f69/forestage-a-linux-amd64"
    sha256 "f11dd14de7ed1c19247e8f2ff27235c89bac750d782c06792df0acaac97508c1"
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
