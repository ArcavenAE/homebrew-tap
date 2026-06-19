class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260619.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260619.4/jr-a-darwin-arm64"
    sha256 "48e09115d2e43d9b3e12b408cd2caf2efbe66a88c406f97ea7bcfeef8c2b5aa5"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260619.4/jr-a-darwin-amd64"
    sha256 "96f744d5579fed84437ff901127abdcefefb22b2667694e1ae20333f50a8b967"
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
