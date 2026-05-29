class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260529.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260529.2/jr-a-darwin-arm64"
    sha256 "05c842d8d970857b0de89bafe3c53fdd0a3719c1a1424ba205cccceb129bf4cb"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260529.2/jr-a-darwin-amd64"
    sha256 "47a49fda78f5a0cc6b36b81ccf9239cb98f330435df7517aa3f6f9a0d953b2b8"
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
