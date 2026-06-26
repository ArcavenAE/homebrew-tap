class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.7"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.7/jr-darwin-arm64"
    sha256 "a5830fcf0eb4a081aa761b4d54ae3a320e96dd8af0ccf906397f3cc955a5fa80"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.7/jr-darwin-amd64"
    sha256 "82bba351d55492f86232ebbf26c67f3b7e3e7e32b9dd9133250fa2c6530087e1"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
