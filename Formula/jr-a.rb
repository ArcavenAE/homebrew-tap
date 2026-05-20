class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260520.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260520.2/jr-a-darwin-arm64"
    sha256 "9255625977ee863f1deb18e85d0f235affeda2e581fe5d4c8d3e4ffc1ec06764"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260520.2/jr-a-darwin-amd64"
    sha256 "a5854fe5ae944ac2e5f4489f4bfa72bf308d553e8ca2b7c004bf64a5122d4e2a"
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
