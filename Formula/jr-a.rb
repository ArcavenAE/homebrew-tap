class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260531.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260531.1/jr-a-darwin-arm64"
    sha256 "e59fc3b8a7e8aa1e98e85c45ded288db7a4f1fe994ba8b95c242a34b58fb3193"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260531.1/jr-a-darwin-amd64"
    sha256 "f8f38d784721ab8164848dc60f5c3dea13a4c3be82e5794e13e33e8faf4994a7"
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
