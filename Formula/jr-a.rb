class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260529.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260529.1/jr-a-darwin-arm64"
    sha256 "c54487a78720dc1fd0779facf093be8860e48be893ff2a5b8a504e8c5248b784"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260529.1/jr-a-darwin-amd64"
    sha256 "21c59a914d06d71aa1cc5acb9a7e08858c0384e05766976e4f275afd03c5da7a"
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
