class Wirerust < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "0.13.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.13.1/wirerust-darwin-arm64"
    sha256 "855945945d85af3bbb9b11880b392dd5e689956b06f5a79105d5de60ff89d0ed"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.13.1/wirerust-darwin-amd64"
    sha256 "d07645767f5fe5f67d66ec496deecf0c005bba9a47e0ce3b6d23dbb17aa062c2"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "wirerust-darwin-arm64" : "wirerust-darwin-amd64"
    bin.install binary_name => "wirerust"
  end

  test do
    assert_match "wirerust", shell_output("#{bin}/wirerust --version 2>&1")
  end
end
