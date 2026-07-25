class Wirerust < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "0.13.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.13.2/wirerust-darwin-arm64"
    sha256 "ca7a5e7e534fdd52f32d234645778c7e13db33ccb2e747e03b4ed3a3a6a66752"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.13.2/wirerust-darwin-amd64"
    sha256 "b2bf1a8e1ac20794b1907eeea780af45191a9a6f771d844cafd341a47579c911"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "wirerust-darwin-arm64" : "wirerust-darwin-amd64"
    bin.install binary_name => "wirerust"
  end

  test do
    assert_match "wirerust", shell_output("#{bin}/wirerust --version 2>&1")
  end
end
