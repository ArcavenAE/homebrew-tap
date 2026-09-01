class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.7.0-dev.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.3/jr-darwin-arm64"
    sha256 "4ca9c3434bafd00c47e883f2a0dd906e77a4a90ec4099112e7a4449ca56dab21"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.3/jr-darwin-amd64"
    sha256 "227fb9be96f571f63601d5539c40697de9e3574b9e69d6f4222fab3d7f47adf5"
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
