class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260702.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260702.1/jr-a-darwin-arm64"
    sha256 "f697dc8ce00238fd2c1c66ed8152175541d7b298842cb6b69102e3f93abe8ea1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260702.1/jr-a-darwin-amd64"
    sha256 "cca319aefe78eb1a9c66b8e5dbd6c4b23cff46101fe9217ea45e7297fbf8a65c"
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
