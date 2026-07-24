class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260724.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260724.1/wirerust-a-darwin-arm64"
    sha256 "98d2324aad9422190f24464665bb8f52fd28b1d4c1b956ee9c4479d81a6dc8b1"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260724.1/wirerust-a-darwin-amd64"
    sha256 "e2e54472c9ac2dfc980f28f65443d0a0495f3145b70aa4c419257823ea773f26"
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
