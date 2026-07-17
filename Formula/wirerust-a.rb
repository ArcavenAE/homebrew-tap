class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260717.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260717.2/wirerust-a-darwin-arm64"
    sha256 "7358a091331d2f583a879d7d19cc75f4a6e0fa33d8c25f7673279f870238d83c"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260717.2/wirerust-a-darwin-amd64"
    sha256 "d3a4591e43e1146cfa6a994ab4775cc0c6892f17bd04372cc26a7a05f630065b"
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
