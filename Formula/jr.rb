class Jr < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0/jr-darwin-arm64"
    sha256 "6c2aeb11e99a704a1d0b6be4cc9015c03112e8fe6b1496f4554c4955e3eebe10"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0/jr-darwin-amd64"
    sha256 "a67c512d79f26c1a4e670ae8d7b285648b05b3ead2280e159805d42314dc5b49"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr"
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr --version 2>&1")
  end
end
