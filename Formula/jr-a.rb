class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260714.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260714.2/jr-a-darwin-arm64"
    sha256 "85c092824933191279f4bcde0de717b4387c5ec9252c5f6d05d26aa3c0248afb"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260714.2/jr-a-darwin-amd64"
    sha256 "c98c29b8e957dfd21c0e3ef92c9ca2b459cb566840f6fc93202bb2af57f12954"
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
