class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260717.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260717.3/wirerust-a-darwin-arm64"
    sha256 "a2258b9395c568673a9d1be5e0e5613f7145a7e6ea3f1caa14a829ecb11fab13"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260717.3/wirerust-a-darwin-amd64"
    sha256 "91e768d892d5691c6a88d3cc61e03215797a5ba1f1d3186d93e7a78134f59ae1"
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
