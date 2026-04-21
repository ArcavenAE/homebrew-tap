class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260421.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.1/jr-a-darwin-arm64"
    sha256 "51ff5549a54d8363603098ea2d3e1232c5ad5d0b0a96eb7b5ac68809a6735e51"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.1/jr-a-darwin-amd64"
    sha256 "b57116862f1e0ea5b947635ef9e18e8901603ac7128e7f7e390d25c1120b1802"
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
