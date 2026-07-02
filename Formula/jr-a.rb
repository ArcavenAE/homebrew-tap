class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260702.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260702.2/jr-a-darwin-arm64"
    sha256 "10db3c75a30164090b0dc65a63b2d433fa1be2a27d583a98d3beb43d1b4d9758"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260702.2/jr-a-darwin-amd64"
    sha256 "93f109777f62b6b74c5fcb45ff130a843ace49676c58fe59b043f94f73ecc0e2"
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
