class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260918.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260918.1/jr-a-darwin-arm64"
    sha256 "6486c8507d3b97593984b5bafe640cb7742d9ac959e7ca13745ca49ebf9d4d19"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260918.1/jr-a-darwin-amd64"
    sha256 "ed72fe73b788b7b4b8a8ed42f9f0bb5b258b3ccd700211b39389386c49ebddf1"
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
