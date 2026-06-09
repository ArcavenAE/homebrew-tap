class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260609.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260609.1/jr-a-darwin-arm64"
    sha256 "cba422ebdf01d6f3867ae1ca3529c9af352264ae529954be4fd8565e155d1828"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260609.1/jr-a-darwin-amd64"
    sha256 "73c18c876915176c12a77bdc73b4d104b9df341e4b477ee0861ae4d716388b90"
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
