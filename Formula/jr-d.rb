class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.3/jr-darwin-arm64"
    sha256 "852da5d7f43a9a0859c6ac980c02023223a29b94605fbfb318903e43e38072b7"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.3/jr-darwin-amd64"
    sha256 "16e1e99cb0d780f8f368e47390ca64176b7fcc1ab9c647c3995005b099991bee"
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
