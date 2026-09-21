class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260921.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260921.2/jr-a-darwin-arm64"
    sha256 "2efc32b635223e85f2a8ce4174a432a14ecde8f55a07dc2f93f456b26a104aca"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260921.2/jr-a-darwin-amd64"
    sha256 "ced47859484ac90f2ffdc5dba2d184aaee6f7c193f3b0daaa9dd7822323e01bc"
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
