class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260714.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260714.1/jr-a-darwin-arm64"
    sha256 "93f626291c9804353061c3ca03270f76db3ed364729828c77c36edb741578242"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260714.1/jr-a-darwin-amd64"
    sha256 "16338a0477a8cb3a08fb716b778b14e843da627e54cacd9eb88cae34e4046a54"
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
