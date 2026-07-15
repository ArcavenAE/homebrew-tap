class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260715.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260715.1/jr-a-darwin-arm64"
    sha256 "37ae8a6fd08f87c214c2516a815e133e593b0db5f9f569bd9843a7723a1d00d5"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260715.1/jr-a-darwin-amd64"
    sha256 "beb5ecc54de419f256cc7641a11cac70f6619e526135b57d16f636e95413b008"
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
