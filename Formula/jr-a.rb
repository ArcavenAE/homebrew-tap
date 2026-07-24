class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260724.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260724.2/jr-a-darwin-arm64"
    sha256 "6ff4cc5575acc79964c4775ac99d2a2e0885543c93fabc8e8c85482583916abd"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260724.2/jr-a-darwin-amd64"
    sha256 "e87719ff95a5079f9c0abe2b0987c4ea9d7cc78c05038b63760868c29dcdfc8f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-a-darwin-arm64" : "jr-a-darwin-amd64"
    bin.install binary_name => "jr-a"
  end

  def caveats
    <<~EOS
      jr-a is the alpha channel. Updates on every push to develop.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-a --version 2>&1")
  end
end
