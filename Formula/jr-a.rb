class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260427.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260427.1/jr-a-darwin-arm64"
    sha256 "251238a70bc9a9f94566d181d409bbc86ea2a1be9fe14e003286cf28923a51b9"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260427.1/jr-a-darwin-amd64"
    sha256 "9e85cfdadd91c0206ef1c9fc6fa88fc0e75cb2c1a3024136707d83148b8541cd"
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
