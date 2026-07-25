class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.11"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.11/jr-darwin-arm64"
    sha256 "488325e882321070df9a45762657ae1948d7f1023ffd8b6850036d19b633bfe3"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.11/jr-darwin-amd64"
    sha256 "d18720361f91411853ed50a4a62acd2d117b88396f4c4133d7db2832eaebde97"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
