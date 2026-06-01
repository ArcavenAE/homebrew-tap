class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.12"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.12/jr-darwin-arm64"
    sha256 "883ae9df3ccd81f565b5db42ed9d477c13daa52d40ac8f2b6530f45a3ae45d18"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.12/jr-darwin-amd64"
    sha256 "0c4d6bb801c7c197d1c26ddfcfe579c30c283336869a9470c633312f9da73689"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
