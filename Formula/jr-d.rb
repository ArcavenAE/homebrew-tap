class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.12"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.12/jr-darwin-arm64"
    sha256 "b518a323971306fb846b1c2646016654cc92ed30fa4d24f37d4dc587dfedd8fc"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.12/jr-darwin-amd64"
    sha256 "4c093b04c3ee6fe77fa6c9a5209c168c079eabd0b5f3affac6d6ea1ba56da170"
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
