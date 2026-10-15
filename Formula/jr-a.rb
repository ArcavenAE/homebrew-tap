class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261015.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261015.2/jr-a-darwin-arm64"
    sha256 "550151b2919ce4cd43efdfbd607d29d7267bc695f9cd9a296ba69493d8f1a8ed"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261015.2/jr-a-darwin-amd64"
    sha256 "be466c82b8b2c260c81d4757b323894cd9282805131d9698eaf398ef2ac512b6"
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
