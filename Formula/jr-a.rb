class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260602.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260602.2/jr-a-darwin-arm64"
    sha256 "35f0f6e5809b2fff80729ab40e528474fa15ec1dc88da581e2aace230bae47a1"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260602.2/jr-a-darwin-amd64"
    sha256 "dcb675b7c866f6e94bf5210f554e415c9d7d390354177fb93612237a21dc80b9"
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
