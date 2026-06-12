class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.14"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.14/jr-darwin-arm64"
    sha256 "71a4aba759db97f3f5594271dc8d72d5ec54bab563866d4de5b5f93b2928848e"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.14/jr-darwin-amd64"
    sha256 "a11712c90944ea57b709dda97effe83d38bfc346dce23bad7f83f33a1f6a4497"
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
