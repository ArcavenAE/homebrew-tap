class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260919.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260919.2/jr-a-darwin-arm64"
    sha256 "862e90d929032ceac2e584d0a44e6e7bf76963e8dca43bee10f0b2506e7b35c9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260919.2/jr-a-darwin-amd64"
    sha256 "3869cb521ac9b3bd0501d8f1637d72457a65a695f0ca92490b3def312ab194e7"
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
