class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261005.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261005.1/jr-a-darwin-arm64"
    sha256 "a172d0f1870d4cc3e5285d3e03dbd3cc1d8bea287c1ad34f4855001fc6ab2ab7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261005.1/jr-a-darwin-amd64"
    sha256 "92ee9d23d592c7cc7a885a18f8e24b0ce2851b5ecf9a255641192c7fffd9ea14"
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
