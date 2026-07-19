class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260719.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260719.1/wirerust-a-darwin-arm64"
    sha256 "169b64bc7e6fa50a96153d2c9035de2677b9c9f7d0f4de96eb319c69c39c045c"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260719.1/wirerust-a-darwin-amd64"
    sha256 "e55c7328f5163a42297e158caad1d8470bf95ffea48a538e9f24b566676311d6"
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
