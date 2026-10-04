class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261004.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261004.2/jr-a-darwin-arm64"
    sha256 "6bd99d94afbb89224267a4740c3265bbe8dbec5d8a0d1d622a4196ab75132a78"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261004.2/jr-a-darwin-amd64"
    sha256 "6bb71b0798d4f088064bc2f3e43ba70876801c8013f76bfa25b43797f31bdac5"
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
