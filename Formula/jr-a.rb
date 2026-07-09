class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260709.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260709.1/jr-a-darwin-arm64"
    sha256 "56263e50b9b8d4c4c832c663864a769c1e2acb36403abe50b6bfa3ca4228fc6e"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260709.1/jr-a-darwin-amd64"
    sha256 "ed2892f3fe7137962a73e47cd769b6a11db2c9fedef2ac596a834e0131c5bdb0"
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
