class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.7.0-dev.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.2/jr-darwin-arm64"
    sha256 "4ab74fd2fdee8d27c911676642e84ba930945f780714f7f46a3e1598a41f741c"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.2/jr-darwin-amd64"
    sha256 "7f7a8a58754a70f53eaaf7b7cb604366784f42ad69ff2f55f1286e373fb2dccb"
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
