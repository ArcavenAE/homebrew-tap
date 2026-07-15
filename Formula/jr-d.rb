class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.10"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.10/jr-darwin-arm64"
    sha256 "19e86ed10ded5586b290e1363131c42adb58ae3d0cb142f9262fcb36fc81e9df"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.10/jr-darwin-amd64"
    sha256 "98d9e083174f767ca9e674f787e5786b2889114c6f9fda6ac5c2af2140e216e2"
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
