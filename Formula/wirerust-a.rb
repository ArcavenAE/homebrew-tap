class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260717.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260717.4/wirerust-a-darwin-arm64"
    sha256 "4f70113a19d2698a32dca3659bc12642e1623751499424d6a13251989c8a83d2"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260717.4/wirerust-a-darwin-amd64"
    sha256 "34728fb2ee377ef1dcb6887d633925ae4f5dcb06fd27bd92419a3354897dc77f"
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
