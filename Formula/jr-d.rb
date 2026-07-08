class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.8"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.8/jr-darwin-arm64"
    sha256 "e434c6dd636ceb3a67fc61ab0fef34330e8f84bfeacd01d488ea3249eb5c4631"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.8/jr-darwin-amd64"
    sha256 "933fdb6800a10eb312ac92f1f2e62e5f98c0fa7bcb6e75264f444d67b8c14345"
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
