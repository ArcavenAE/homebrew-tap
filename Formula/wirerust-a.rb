class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260718.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260718.2/wirerust-a-darwin-arm64"
    sha256 "8715a58520d8c6399c92e12ce5c8af0fb3e89a2fdd85f76f8496c220b1700159"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260718.2/wirerust-a-darwin-amd64"
    sha256 "5e2ff2784f73ffa626723f788dc806739d2834e6306078a966f19440a7da98aa"
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
