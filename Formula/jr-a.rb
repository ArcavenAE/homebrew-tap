class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260910.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260910.2/jr-a-darwin-arm64"
    sha256 "bd509b5e979d1483fda799da4629517ede78692cb7dff622d107dd86d12855ca"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260910.2/jr-a-darwin-amd64"
    sha256 "08f246785c14ce3b5d8eb6e043be9f3035f3870e951c3ce97c8a550dfa4f8eef"
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
