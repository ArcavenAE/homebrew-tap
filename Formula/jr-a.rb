class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260822.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260822.1/jr-a-darwin-arm64"
    sha256 "8a10518738b24a04223cc993dac0513969c591417e277f8415d327b09c4e0ce0"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260822.1/jr-a-darwin-amd64"
    sha256 "834687af89f4d03c29a226e8cb72ba3de2aa11136329303bfba8cb2b6d0b956d"
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
