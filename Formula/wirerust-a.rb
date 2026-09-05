class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260905.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260905.1/wirerust-a-darwin-arm64"
    sha256 "cfc6f2df931771fb6eb77a0e3ae6cb26dfdce40838a56a3ad7fb14b8fd57579f"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260905.1/wirerust-a-darwin-amd64"
    sha256 "21d7bac91da84231ab04eb3ce9e0c4e5f357a77ef48c1b15396ad19998ae2cd8"
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
