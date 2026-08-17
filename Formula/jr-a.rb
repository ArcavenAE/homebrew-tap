class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260817.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260817.1/jr-a-darwin-arm64"
    sha256 "c4cce65b9a3f9c3dc814cb90eeb330306e91e8732e7ef29d70d9a31931ceaf52"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260817.1/jr-a-darwin-amd64"
    sha256 "4d9c0cbd30c4f65d0eae531599318963d74e9390e9cd8c2fa20955fe1bc186db"
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
