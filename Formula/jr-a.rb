class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260923.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260923.3/jr-a-darwin-arm64"
    sha256 "8af2bdb0ee84469f7ee18629bf7faf24ee46716e8840ddce804b91716eae9d82"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260923.3/jr-a-darwin-amd64"
    sha256 "58eaef001d97d2565f6e81314dfb4ab62c8e45c9a3909259aca01f2fa25d6e01"
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
