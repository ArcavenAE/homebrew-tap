class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260509.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.2/jr-a-darwin-arm64"
    sha256 "0695596a24c3c653174a27f3ae6eb6d6ac3e2fecaf687cdeccfae845368aa437"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.2/jr-a-darwin-amd64"
    sha256 "07aa57657b603df84c262aeaa0d046228142986387b42a36e66d6200be3a6a0a"
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
