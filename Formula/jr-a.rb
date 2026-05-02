class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260502.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.1/jr-a-darwin-arm64"
    sha256 "b2c4fce0904f34e7d6e21b5d7c4a39a9dc87ce1134c083352b84e8bd778f2195"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.1/jr-a-darwin-amd64"
    sha256 "759573497b775b087ebc182df75b070ef3b6812c5eab24608aefefb06159a6c6"
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
