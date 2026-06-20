class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.6"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.6/jr-darwin-arm64"
    sha256 "cbfb524ed47c57c8c7c2e5dad881b871c33247384a6abbc20e95484a8a42c9c2"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.6/jr-darwin-amd64"
    sha256 "b10c6953b413128dfbea915849dfa4a5de4a5fe73500e7dccbddcc5fe7bd7c32"
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
