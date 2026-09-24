class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260924.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260924.1/wirerust-a-darwin-arm64"
    sha256 "449b1dce138ce7957da0ebd93ca40352cfc9e7ae940653f80b37b8fe6d9f65ad"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260924.1/wirerust-a-darwin-amd64"
    sha256 "17169deca7d05d0d21c4cd6df46f791168736280847acfd98636478bf295f95c"
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
