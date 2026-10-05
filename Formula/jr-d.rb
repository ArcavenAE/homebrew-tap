class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.8.0-dev.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.8.0-dev.2/jr-darwin-arm64"
    sha256 "e7d6ee3f6fc6b926bb9cc0f419c2cbd43e60ec5c2ffedb1d479aea12292fa2d8"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.8.0-dev.2/jr-darwin-amd64"
    sha256 "aea0fb12235e5d0710c5845bb1fd285e99de3a88af15ecb607733f0f5682ef04"
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
