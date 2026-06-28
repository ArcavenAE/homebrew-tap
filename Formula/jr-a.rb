class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260628.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260628.3/jr-a-darwin-arm64"
    sha256 "4bc13506714649ab7b5d8817780eef3261eed96e2e8f611332bdbd399a861ec7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260628.3/jr-a-darwin-amd64"
    sha256 "a0e5d4e629ddba40335899315a556aef9e71204492b6c508822766948a0bac6d"
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
