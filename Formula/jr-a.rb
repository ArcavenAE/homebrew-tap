class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260628.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260628.1/jr-a-darwin-arm64"
    sha256 "3f4fe090d6e9588d5e0ba3e42780409c9050192901f93bb98d87b9b36adbb198"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260628.1/jr-a-darwin-amd64"
    sha256 "58ed45f67c34140c0e959af062993788d97b2baa5f31398961d02d7a17b47e88"
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
