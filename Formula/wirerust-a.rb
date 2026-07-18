class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260718.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260718.1/wirerust-a-darwin-arm64"
    sha256 "814773a751a73ae69e7be296b84e7259eb4d9770482c9ed846fa9ba064d37e81"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260718.1/wirerust-a-darwin-amd64"
    sha256 "43ec54a6f4f12e53d92e348d5f526b3f9fce227c1976af8bc74a579602299e54"
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
