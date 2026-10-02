class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261002.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261002.3/jr-a-darwin-arm64"
    sha256 "c11fcd74d8e957d0dc105fed9cb45b4b383f1f6a2974a268e4400c1ea09bf83f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261002.3/jr-a-darwin-amd64"
    sha256 "d0bda0db0b232130c194f80a7439d3cf959ced7ee8b967494d45c1596911f2b8"
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
