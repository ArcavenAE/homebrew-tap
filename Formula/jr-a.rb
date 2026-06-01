class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260601.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260601.1/jr-a-darwin-arm64"
    sha256 "70a16a7ca3206cfc429dd257611b81842ac5f186cce2ab6db6b600909cc21afb"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260601.1/jr-a-darwin-amd64"
    sha256 "e56796cd7d4e2623bb5af744696b972fa87638875b84abfa3e9b6a4665374897"
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
