class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260423.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.1/jr-a-darwin-arm64"
    sha256 "f20ee34c8cf23cacfee05ee0060fbd4576222e02e96df34b75438825cf23f079"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.1/jr-a-darwin-amd64"
    sha256 "876b82f5736ed43e2304b0fed0f7f13280cb4b3446ba129b89bbd5b99c4ade21"
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
