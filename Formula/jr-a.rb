class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260918.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260918.3/jr-a-darwin-arm64"
    sha256 "81ea0c4c8ee301c6ec747c7b9d5ff9e9c22b2822f92b693544eb64b5feeed147"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260918.3/jr-a-darwin-amd64"
    sha256 "5c4621034992133b7cd17d23b4d4b9e91e376a10f4f590bc1ca8b4999fcde292"
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
