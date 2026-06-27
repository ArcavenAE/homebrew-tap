class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260627.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260627.1/jr-a-darwin-arm64"
    sha256 "255db51f53b3ec2782781b3d5f6efb70a3acd5ea8024b244818694ed0414f4d3"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260627.1/jr-a-darwin-amd64"
    sha256 "747479fcdb3850e145a2ace064191b936898edc13e16bb91809907d2b8e27b51"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-a-darwin-arm64" : "jr-a-darwin-amd64"
    bin.install binary_name => "jr-a"
  end

  def caveats
    <<~EOS
      jr-a is the alpha channel. Updates on every push to develop.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-a --version 2>&1")
  end
end
