class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.2/jr-darwin-arm64"
    sha256 "15432505ffa1ff0ee2a333e9ceee3e422e09ee7d73054998902ff956311e352c"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.2/jr-darwin-amd64"
    sha256 "7cc8515a7d64956ebc4acbc3a54a85773af0c38383400f83d5aa164aa1bd64f7"
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
