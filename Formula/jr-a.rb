class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260421.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.2/jr-a-darwin-arm64"
    sha256 "90042a5796da53edf65e44101af576eedb398d27a4ce9e41f5b563786c40d79a"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.2/jr-a-darwin-amd64"
    sha256 "02627d7af9c4c5842c588d87648fa471d913f009bc9ff70804cf706175954a05"
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
