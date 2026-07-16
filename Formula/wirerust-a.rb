class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260716.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.3/wirerust-a-darwin-arm64"
    sha256 "c39922acdafa08f43277e6a45b03b6ebae85aa8c247fc47810c1b67850ab294a"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260716.3/wirerust-a-darwin-amd64"
    sha256 "0e54a9a6ece66dd2e582e9ec06da352785d0ebce15ded2f280560ecee37ee30c"
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
