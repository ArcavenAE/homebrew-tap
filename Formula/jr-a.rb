class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260721.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260721.1/jr-a-darwin-arm64"
    sha256 "cc14d9ca942d7e5e9b1905b26bc995645f3f6033c70d36ec328e1097cf7c65ac"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260721.1/jr-a-darwin-amd64"
    sha256 "1eb1d94b80bdecaabd8b98174333b129535608a2bf7ea6cb9e7c2f104333a3fa"
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
