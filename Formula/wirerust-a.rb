class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260725.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260725.1/wirerust-a-darwin-arm64"
    sha256 "134bda18786418c1acc6817d27bd16daec98ec7e56ff57bf258b487f8a9ce8f2"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260725.1/wirerust-a-darwin-amd64"
    sha256 "1e4530e54f20b952d1be94479b58f92781be6f51c07759c0c96a97c3e648535e"
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
