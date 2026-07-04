class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260704.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260704.1/jr-a-darwin-arm64"
    sha256 "51b89f0ac74881505655bce398a320578bfaf46629b0f15407a3b9b2aab31eac"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260704.1/jr-a-darwin-amd64"
    sha256 "b76f5fba65f7b546f992c7fb8e716d97ac3c82e44cbef5b889dea5d4bca8e6cd"
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
