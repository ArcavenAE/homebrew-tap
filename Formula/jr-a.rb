class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260502.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.3/jr-a-darwin-arm64"
    sha256 "431fa85aaeeba028f9cb64d50a147bb3a6e63c8ebe079af8084c99a4b31e2eb7"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.3/jr-a-darwin-amd64"
    sha256 "f2b8adf20b249b305e81615fb14b8d67342519f3a85a7dfff3bdc1b2d09a1038"
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
