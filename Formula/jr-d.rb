class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.7"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.7/jr-darwin-arm64"
    sha256 "382ca5f9a02018e3b36aeeb408fad8ab10922430f2f44acfa861bc376029c1cf"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.7/jr-darwin-amd64"
    sha256 "b204e4c13612dc1ce0011b1240cc5975c5bb7ac77872b36b05b1a426d19594a8"
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
