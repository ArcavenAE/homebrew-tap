class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260424.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260424.3/jr-a-darwin-arm64"
    sha256 "ee57f4da2638f9a8e8178c0ab143c0933da55f2a335791f50da6e20ba2d01ef9"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260424.3/jr-a-darwin-amd64"
    sha256 "b9165e3394522e0c7d206b7bb02d97b82f9c92e72e36d01bb648b6dab469a366"
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
