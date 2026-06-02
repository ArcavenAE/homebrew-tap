class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260602.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260602.1/jr-a-darwin-arm64"
    sha256 "3e4399cf62210dcb6f626cc5318d3fc7fc9471f8887f926637a4d156aca781b2"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260602.1/jr-a-darwin-amd64"
    sha256 "471a825f6574346b4d28b950664ff1392d44e36b19cf284b8a858d31975e3740"
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
