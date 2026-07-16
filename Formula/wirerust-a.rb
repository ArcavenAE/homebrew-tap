class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260716.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.2/wirerust-a-darwin-arm64"
    sha256 "6292b08602505f2860324ddab979110ebea8ea5e3ca376d656176237c37baec2"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.2/wirerust-a-darwin-amd64"
    sha256 "e82e229dd31b62d36d5a9db2cc526a1a1b488ef6744a622d5c0e582fc94179b8"
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
