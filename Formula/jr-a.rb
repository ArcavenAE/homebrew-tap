class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260813.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260813.3/jr-a-darwin-arm64"
    sha256 "5d5d26976e977b992d98c84c18fceae3e3e9ba39ecf0cd09b8479cc3dcf0b7c1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260813.3/jr-a-darwin-amd64"
    sha256 "25b683a543ca9a0439e4e12e0ac99c836e079d561e754ec183ca1ebf135e3d82"
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
