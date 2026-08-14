class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260814.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260814.3/jr-a-darwin-arm64"
    sha256 "dd91e051bb561447fe56d40761093eeaa249fcbf9e2ecfb129241daac689a039"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260814.3/jr-a-darwin-amd64"
    sha256 "41367856559c3bcfb4a14c645e1c6d361d5ed2afe615010ead9cbfb2e7d0aa11"
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
