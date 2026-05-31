class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260531.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260531.2/jr-a-darwin-arm64"
    sha256 "3a1deb5883997b16043f00d7099444d4f1b32b515ebf7b68bbd5591cdf82b208"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260531.2/jr-a-darwin-amd64"
    sha256 "baea0f8a5c063bf04c7df57ef1eebe9f7ce0097f563904f909bcc13e159bb0b0"
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
