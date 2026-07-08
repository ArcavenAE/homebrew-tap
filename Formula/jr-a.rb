class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260708.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260708.1/jr-a-darwin-arm64"
    sha256 "a2c0329d300f69052d0d59d4996e148cbbb2b50b34534af2cd5025734c1e999d"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260708.1/jr-a-darwin-amd64"
    sha256 "88c95bb8ba0c82407068bd6c98ed6c628b7a067baf5a1a7651a0e7f20acd010b"
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
