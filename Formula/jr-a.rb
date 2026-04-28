class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260428.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260428.1/jr-a-darwin-arm64"
    sha256 "171069eedad9f62d125c5867f49e4e60424aa667634fabf1a8e44b2680f94e89"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260428.1/jr-a-darwin-amd64"
    sha256 "83eb33f740cd74ec3d76a9449bbbac3f8607015b2884afcce78c871a023059eb"
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
