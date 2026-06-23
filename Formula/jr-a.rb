class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260623.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260623.1/jr-a-darwin-arm64"
    sha256 "0406ad5768697a158d8a64a5d67345407824d5e5627622556a168b580e60ae6f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260623.1/jr-a-darwin-amd64"
    sha256 "43483b6aef8e65c4d8cec483c2cb6bb9562225776996bc1c7775e6328290178a"
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
