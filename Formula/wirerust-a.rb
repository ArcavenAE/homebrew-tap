class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260720.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260720.1/wirerust-a-darwin-arm64"
    sha256 "178b337e4aaab982846ff0951a5077396e80f91d2ef787fa0cf28f438713a4bc"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260720.1/wirerust-a-darwin-amd64"
    sha256 "9d1298bf9ff5ca745a1dea63d2eb678ab16c62fdc4790006a057469acd8765f7"
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
