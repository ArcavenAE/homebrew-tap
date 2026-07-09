class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.9"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.9/jr-darwin-arm64"
    sha256 "1c9ae2aca18bd225a324f6b4aeaf3371846ca0222d563929eae3ba46cddd209e"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.9/jr-darwin-amd64"
    sha256 "579b3033e4ec79b46af63a5c2184646965838769ba2de77f2e5514d152a4a271"
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
