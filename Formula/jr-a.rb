class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260625.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260625.2/jr-a-darwin-arm64"
    sha256 "e8687513cbaecde30080eb3e5cdedea5478f1bd000124a8fa3350d8a36b34233"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260625.2/jr-a-darwin-amd64"
    sha256 "0fa208852ad023e004eb43756bdde6585e2bbeea87f8309de2aa0dcbca069acc"
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
