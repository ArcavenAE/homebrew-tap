class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260905.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260905.2/wirerust-a-darwin-arm64"
    sha256 "65b04b3a419a2121eb7b5f647be8e5612c9c04dd2917b9af1c08d83a16a8a5ce"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260905.2/wirerust-a-darwin-amd64"
    sha256 "9a75da093459c0eb4cc1083860586d88f5d00d3cbd2183b6d282577ee944ed8d"
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
