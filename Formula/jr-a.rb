class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260910.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260910.1/jr-a-darwin-arm64"
    sha256 "61ccf09aa91de3066cefe2538a96dc9f30ea4544d991b3ab210508baecc41f37"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260910.1/jr-a-darwin-amd64"
    sha256 "0e48014bffb51c73b28f480337e17ea54e5ee985e0211a0b0a54faf65c43d61d"
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
