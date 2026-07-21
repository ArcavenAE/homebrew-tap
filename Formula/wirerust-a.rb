class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260721.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260721.1/wirerust-a-darwin-arm64"
    sha256 "c1be546e3496dd9ef55ee815fecc50ddf16551e3c5575a86b4a1fc31b098edf8"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260721.1/wirerust-a-darwin-amd64"
    sha256 "a9ea4d38422d36ec4bbca4f8bda7e62fadc8b158375499acb76fba9fdcdd7616"
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
