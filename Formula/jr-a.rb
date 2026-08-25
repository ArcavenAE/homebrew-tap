class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260825.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260825.2/jr-a-darwin-arm64"
    sha256 "086ea74035128d059d2903e84224a4010407a7153529c4af89d053b1f8e6c99e"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260825.2/jr-a-darwin-amd64"
    sha256 "d75f0d9304c88990abb63492effbfe3c25c05ae7b7ce05e8bc0f6d32480e90f0"
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
