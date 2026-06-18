class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260618.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260618.2/jr-a-darwin-arm64"
    sha256 "c6676e31caf467b9d3586754be81071c3c12737a705bfd91f100cc7713d9c6f7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260618.2/jr-a-darwin-amd64"
    sha256 "37e14f7849853776ce4c1fff37f7fc08d2403ae9b3c460c5bfd6ab831412de36"
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
