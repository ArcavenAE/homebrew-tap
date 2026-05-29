class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.11"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.11/jr-darwin-arm64"
    sha256 "8a60692992fc7c4ee6a41569bf7cda4b0cdf37eb4621528f0291dacb60a1c767"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.11/jr-darwin-amd64"
    sha256 "db914adb57f50b90be3a52dee9c5cf672f29144350470e5a0b10c740f70da1c2"
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
