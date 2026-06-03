class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260603.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260603.1/jr-a-darwin-arm64"
    sha256 "32b5ba9671f82b35e3de7a630f8f0775fdf7166cd6a47e7bbb4c525faa54891b"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260603.1/jr-a-darwin-amd64"
    sha256 "18516f59c76b2c5ea0fc46b9766ac4c8f4c4bcf5a5d6a7dd9d93925a69ba35c9"
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
