class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260611.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260611.1/jr-a-darwin-arm64"
    sha256 "bcb19d83886057b53df14e06adcd403a40aa62fe7c3debf8dd26a149a3434a1a"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260611.1/jr-a-darwin-amd64"
    sha256 "add641f59f31ba8ccce1edb7dbb4835cb3cccd84cfbdba807b5f5dea98691315"
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
