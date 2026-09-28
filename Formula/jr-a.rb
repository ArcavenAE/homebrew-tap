class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260928.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260928.1/jr-a-darwin-arm64"
    sha256 "bc9fd2b50ca6462e82af145e5d9f65aec6b2f2e682e73dfddea2644a1712e7b3"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260928.1/jr-a-darwin-amd64"
    sha256 "0ecb0f4885b4bcdfd45d22a09dcbbfd37ea2e42afc3fd10c0b1335671e66dc47"
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
