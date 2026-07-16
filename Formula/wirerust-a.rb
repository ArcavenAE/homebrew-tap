class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260716.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.4/wirerust-a-darwin-arm64"
    sha256 "97af4b5f8d54dd472a21fab726d744bf95cd4fd9057e35a2ea27fac8bcaa0e59"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.4/wirerust-a-darwin-amd64"
    sha256 "e342a5e485fa4d19f0fcf54afe28e263d88780be3bfd6d210b9a55c8cd486d29"
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
