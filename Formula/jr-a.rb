class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260424.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260424.2/jr-a-darwin-arm64"
    sha256 "4df6b1fa33346c149e99247076da8336e016a0de060f0aa17df93c4a4fd6032b"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260424.2/jr-a-darwin-amd64"
    sha256 "724aa7094ff3dda0ce5d582cc2e7b5a31a0ee629a40c5a392590fc1f5c86da00"
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
