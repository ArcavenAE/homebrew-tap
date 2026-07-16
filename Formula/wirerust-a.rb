class WirerustA < Formula
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260716.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.1/wirerust-a-darwin-arm64"
    sha256 "6bf7c7fa24062a23b7ad0480905185c967f094426ff91260f2ed6c8b296abe49"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.1/wirerust-a-darwin-amd64"
    sha256 "7ac80060b834bbc59e43e44cc9bbae203f19fbe8f24e0c53218fbd03211fba87"
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
