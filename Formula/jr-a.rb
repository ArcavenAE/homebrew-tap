class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260707.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260707.1/jr-a-darwin-arm64"
    sha256 "fd65e77d3dd7aeb1ed56be44506291d2b25f3b7b2160e7af5d1a1a618f41ebac"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260707.1/jr-a-darwin-amd64"
    sha256 "101bd0da85a6c87cb39d058e543203019df0a14d148d40ce1a9be75a2a785faf"
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
