class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260510.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260510.1/jr-a-darwin-arm64"
    sha256 "74e2c36c3f92a739fb83841adea4ea128f2adf90fcf4786db92d6378a6616757"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260510.1/jr-a-darwin-amd64"
    sha256 "2df396e6f9dfb204d29b6ee007afbd1d3574c6b35205eda1e3011f56fbdbeef2"
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
