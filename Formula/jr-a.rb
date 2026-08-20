class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260820.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260820.3/jr-a-darwin-arm64"
    sha256 "131fc41fc3cf40f52094968285ef56429dd7903bb5e0bfdb06d07a94ad5d027a"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260820.3/jr-a-darwin-amd64"
    sha256 "64797d3e619e2795cc4b821093ba68ee0cb70716d9bd643ccd06d924a35f9b8b"
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
