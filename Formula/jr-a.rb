class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260929.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260929.1/jr-a-darwin-arm64"
    sha256 "4b24b91b3cf5f12a2d9bda0097fc818f9f13d057e62a50739e874053fc7e3017"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260929.1/jr-a-darwin-amd64"
    sha256 "b3cb63c8eddaf48e6a8307644a0a834af0805dd1861999624540953f8d844ab1"
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
