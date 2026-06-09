class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260609.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260609.2/jr-a-darwin-arm64"
    sha256 "a861f54f754951459b774ec0fc033551f34df202943d6eb42391e999d95a14b0"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260609.2/jr-a-darwin-amd64"
    sha256 "c878496740ea66c28c16e3398650d96a713e1c3ce0f6e1ce15ba44dd68c2ee2e"
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
