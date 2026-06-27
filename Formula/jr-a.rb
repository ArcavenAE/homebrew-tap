class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260627.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260627.2/jr-a-darwin-arm64"
    sha256 "475151fe36a5d96346fd66cda3351191500bf07d6f5c506297445ea714722383"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260627.2/jr-a-darwin-amd64"
    sha256 "616c5edfd02930e80b58910e98b142bf417ccd9b2992c26655a2a0c1ff1bc0ba"
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
