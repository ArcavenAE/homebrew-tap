class WirerustA < Formula
  desc "Fast PCAP forensics and network triage CLI tool written in Rust (alpha ch)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260715.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260715.1/wirerust-a-darwin-arm64"
    sha256 "bc0ac6748dc2801bb6ee457202ddd5197ead6cd99cbc36f7d2bc171a837d769c"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260715.1/wirerust-a-darwin-amd64"
    sha256 "08f2e43491ff4cf2a930980ea83739ec8c2c5625d053ef04b0674561570c9270"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "wirerust-a-darwin-arm64" : "wirerust-a-darwin-amd64"
    bin.install binary_name => "wirerust-a"
  end

  def caveats
    <<~EOS
      wirerust-a is the alpha channel. Updates on every push to develop.
      For stable: brew install arcavenae/tap/wirerust
    EOS
  end

  test do
    assert_match "wirerust", shell_output("#{bin}/wirerust-a --version 2>&1")
  end
end
