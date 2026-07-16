class Wirerust < Formula
  desc "Fast PCAP forensics and network triage CLI tool written in Rust"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "0.12.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.12.1/wirerust-darwin-arm64"
    sha256 "d03e7c240057c276e3050ee79634fe32a5fd24446e0fc0cdbf20c17383df19cd"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.12.1/wirerust-darwin-amd64"
    sha256 "53a56021b117405b129865dbd9e137bfd21d420eb6d37b5d3676da15b5868ea6"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "wirerust-darwin-arm64" : "wirerust-darwin-amd64"
    bin.install binary_name => "wirerust"
  end

  test do
    assert_match "wirerust", shell_output("#{bin}/wirerust --version 2>&1")
  end
end
