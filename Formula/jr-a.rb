class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260930.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260930.1/jr-a-darwin-arm64"
    sha256 "116739c809dd7a031e2dbc2d0d94c5529c77b25c8f1901074feaab2ce88f6cf9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260930.1/jr-a-darwin-amd64"
    sha256 "2b357f25598e4b8bae926b955d4b0c03ad2d530ac1fc1abd11dccad042f924de"
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
