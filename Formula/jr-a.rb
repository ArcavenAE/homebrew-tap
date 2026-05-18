class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260518.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.5/jr-a-darwin-arm64"
    sha256 "96892f2f29a6682263954afed7513fcbbe05a21507cb4cf379f51b659b5f3910"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.5/jr-a-darwin-amd64"
    sha256 "05d78c612ab5477c7a06ff35fe4f77df351a93d50ba3e7d43823fc6be145c150"
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
