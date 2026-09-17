class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.7.0-dev.7"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.7/jr-darwin-arm64"
    sha256 "a9092f5dff127d91a0b8815e6a4426d0275c6e05aa0be20f7c0d4956bc3be596"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.7/jr-darwin-amd64"
    sha256 "3161aa725b1674fe69d8dfa65428cb9ffd7688ae6ff78e814a43468daf80d436"
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
