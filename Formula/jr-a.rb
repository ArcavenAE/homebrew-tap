class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260626.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260626.1/jr-a-darwin-arm64"
    sha256 "ece6f2ed0061a7cd2f84746c273334846a5f8782afd95ece8a18ddb6418267d4"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260626.1/jr-a-darwin-amd64"
    sha256 "050d716a340f0526e3a2bdfe8bf3c2940718ff9d660171fdf5756ee40c1ed5ea"
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
