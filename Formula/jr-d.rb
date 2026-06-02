class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.13"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.13/jr-darwin-arm64"
    sha256 "83f3374e1a0207b28f2a4151e8a2772a2356f72a2141af4d6dcd2f78bf188c2a"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.13/jr-darwin-amd64"
    sha256 "be630a40d46f7a39fe1e6594209cfb1b73902a095717c17f064b4619a60559a8"
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
