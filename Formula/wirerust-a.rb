class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260906.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260906.1/wirerust-a-darwin-arm64"
    sha256 "5650f7ceda5fe36ad34904c265bdc45bcc35b1309776579311ab45b4646df1b9"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260906.1/wirerust-a-darwin-amd64"
    sha256 "b221f40ef8b5aa9dff254f3c37429ae847d85919d89d059a3dd8a63f968a0b17"
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
