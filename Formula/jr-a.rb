class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260720.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260720.1/jr-a-darwin-arm64"
    sha256 "f48fa4e5f3f10e0a53f8553011d6b842fb53341f8dbd265d218527942e5673d8"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260720.1/jr-a-darwin-amd64"
    sha256 "1d240cfd5cf95696efde3998718d602797fce45f4126616dbfd5d79af969f201"
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
