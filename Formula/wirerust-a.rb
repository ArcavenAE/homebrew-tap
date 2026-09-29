class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260929.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260929.1/wirerust-a-darwin-arm64"
    sha256 "84ca40ea9e7d43a325b2e858c0156d39b9b5f4190d071ddde3a080062ead751f"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260929.1/wirerust-a-darwin-amd64"
    sha256 "f24dc4838ff3a190a131924fda5ed945100370cb32df105bfc8c228cc8d6a682"
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
