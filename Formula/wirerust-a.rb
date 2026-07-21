class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260721.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260721.2/wirerust-a-darwin-arm64"
    sha256 "f66f9c9ced6a86e241f08c548caf58b81d24d8be478cdcb8ab57fc1464f9842b"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260721.2/wirerust-a-darwin-amd64"
    sha256 "2232ef27f776058df8f8499773d9d538cfd7c1cd468809270b483368ad832b99"
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
