class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260608.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260608.2/jr-a-darwin-arm64"
    sha256 "f3675f1125ab12be01a91fecb2bb34aca1d2bc0dc832d734727f18e8c6d871d3"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260608.2/jr-a-darwin-amd64"
    sha256 "fbf95565c9a1e2de5d7ed1b8a46b43ed2fe37473b78ac777fd16d3a0aee47416"
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
