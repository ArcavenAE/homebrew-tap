class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260831.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260831.2/jr-a-darwin-arm64"
    sha256 "00c95c4366c3f613b2dcbe1403abd2d2d663603f60d225059f6b52916be874f8"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260831.2/jr-a-darwin-amd64"
    sha256 "0d5a6132a220915220e7bc82c0b52aab0fab5e45961a3bbe4fe55eaf64f5df69"
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
