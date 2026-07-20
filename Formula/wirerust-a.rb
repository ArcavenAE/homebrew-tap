class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260720.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260720.2/wirerust-a-darwin-arm64"
    sha256 "f522cc0fb72d19b8a3d38d7c69f95daa48d545b8dfa926591c60a91693031e56"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260720.2/wirerust-a-darwin-amd64"
    sha256 "c05cfcadb3a89181c26f2fb260e4430f0cb7b3bb7725d550e4a63345e0b55fb3"
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
