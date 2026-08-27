class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260827.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260827.1/jr-a-darwin-arm64"
    sha256 "50bf1ca27006f6bec6a01135c310e1796ecacdad0e218babbe1de3f37ef0e3a2"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260827.1/jr-a-darwin-amd64"
    sha256 "5fba249507b4bdaa5c1a75f6ade4956053630b9c93c1cdb7ca77959e6da75ff0"
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
