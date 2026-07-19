class WirerustA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Fast PCAP forensics and network triage CLI (alpha)"
  homepage "https://github.com/ArcavenAE/wirerust"
  version "alpha-20260719.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260719.2/wirerust-a-darwin-arm64"
    sha256 "a7a2310cf433c179635d75c4ab6024e9f3acd41c73d49ca027352ff316af7088"
  else
    url "https://github.com/ArcavenAE/wirerust/releases/download/alpha-20260719.2/wirerust-a-darwin-amd64"
    sha256 "4603f4e1b93c470ac267d6fbba22363306b557bb2794e4d3da478e11f98a4109"
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
