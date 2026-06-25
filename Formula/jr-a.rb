class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260625.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260625.1/jr-a-darwin-arm64"
    sha256 "5d1de41d8b83ab78ad50925b74c28309ea16be8e61727b715ed951a2202c7f6f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260625.1/jr-a-darwin-amd64"
    sha256 "5a203c61e712f9d49b031f130e577fd5b3a480bc4fc4f8be211aacf3e0cfbd9e"
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
