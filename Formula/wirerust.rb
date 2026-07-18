class Wirerust < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "0.13.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.13.0/wirerust-darwin-arm64"
    sha256 "818cffd0979c5bed11fe6de7c1e5425ae8811bb81093d5f520b27bd83f19be71"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/v0.13.0/wirerust-darwin-amd64"
    sha256 "13c695121e7b908006ed6dc8f18586e06474cbbd7af99a847366810b7a68190e"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "wirerust-darwin-arm64" : "wirerust-darwin-amd64"
    bin.install binary_name => "wirerust"
  end

  test do
    assert_match "wirerust", shell_output("#{bin}/wirerust --version 2>&1")
  end
end
