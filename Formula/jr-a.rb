class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260713.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260713.2/jr-a-darwin-arm64"
    sha256 "d13d2b089dabf0a92cc19c0b08430481e8529af20b6662d4d7c8c4a20b27e8ab"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260713.2/jr-a-darwin-amd64"
    sha256 "dc50979d3af25608ce8f8a532a2fad06dd11df2e49015003e437c3b31207d7c4"
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
