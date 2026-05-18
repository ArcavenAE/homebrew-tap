class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260518.6"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.6/jr-a-darwin-arm64"
    sha256 "c3006a0ad0341c344ec6a1c13a4654aea6c5068dde71fc4eceef7e751a4d3708"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.6/jr-a-darwin-amd64"
    sha256 "67d0a5ca516d3442911ab54868dd412c7dbff2ac9fa3052d915d1fc025ed2660"
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
