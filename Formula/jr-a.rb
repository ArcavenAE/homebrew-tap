class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260612.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260612.1/jr-a-darwin-arm64"
    sha256 "1fd51699102d358a198f85189b05febfe4ac16f9dc42b3e69a8cba68d5107a47"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260612.1/jr-a-darwin-amd64"
    sha256 "9595f1940bdb2018ffeca659d533e018d3f416ee135191f70ee22edd41bde76d"
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
