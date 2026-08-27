class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260827.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260827.2/jr-a-darwin-arm64"
    sha256 "34abb8da13ba9ea15b7f6b3863b082e4693e2995f122217d4ef2ebfe517d1352"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260827.2/jr-a-darwin-amd64"
    sha256 "448f9545d5bc8a99b1e9de6a3123d96caac2165e17151abccb672fea4bf5c168"
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
