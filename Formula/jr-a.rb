class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260701.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260701.1/jr-a-darwin-arm64"
    sha256 "4eabec5a02dd529fc92c1de4d599c02dfb050f6ea0cd990bb0eeb3423187d525"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260701.1/jr-a-darwin-amd64"
    sha256 "72026603eb11a737c756983a88a755b93fd3d7072f36d75df6c8f90435818256"
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
