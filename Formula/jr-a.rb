class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260903.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260903.1/jr-a-darwin-arm64"
    sha256 "f84df7d5e3cdea4bc3edb8da4ebbe1145e112dbe968ddb763760e0eb3d68ff51"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260903.1/jr-a-darwin-amd64"
    sha256 "39e44a51ffeebfe2d564ed5c9b326716a63a4320ce72ed998d3d8de2cc9465dc"
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
