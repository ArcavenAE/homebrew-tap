class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261117.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261117.2/jr-a-darwin-arm64"
    sha256 "af5e1110ac6c7d813027e4624d3d8c974a994cad6b4c9da3e7a2e4ac045acfda"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261117.2/jr-a-darwin-amd64"
    sha256 "da619d8bb8c48b209c8e85b032a5ff64f8d6256bd85cd6294f906d173a8dc67f"
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
