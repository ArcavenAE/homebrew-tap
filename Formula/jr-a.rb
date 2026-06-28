class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260628.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260628.2/jr-a-darwin-arm64"
    sha256 "129cdff700fe6ce2599b202c516b252878da8efd8652d99de299a79ad2fa34b6"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260628.2/jr-a-darwin-amd64"
    sha256 "94448656b1a558973ee234ed864a6a56b8da3e6682befa81ed4ffb59fd5c7583"
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
