class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260610.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260610.2/jr-a-darwin-arm64"
    sha256 "39cd6655dfd2d4e8515e944c0ec88cba8c05388d2dffeaf6ecad435b6942879a"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260610.2/jr-a-darwin-amd64"
    sha256 "b4c27c86107761242558b7b28a8582f188f00e02c81742d5e406ddf84f1e965c"
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
