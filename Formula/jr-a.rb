class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260713.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260713.3/jr-a-darwin-arm64"
    sha256 "01a1748e5051b012f5369783365e8a3e6b79b840264e1757539454d9b88b96c1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260713.3/jr-a-darwin-amd64"
    sha256 "50c11958c38e65ccf242fe4d827a63a65acd44dbea5d849ac50f4ac9aebefc82"
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
