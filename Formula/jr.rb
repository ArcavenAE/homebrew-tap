class Jr < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search"
  homepage "https://github.com/ArcavenAE/jira-cli"
  # No `version` here: the stable tag is v<version>, so brew scans the
  # version from the URL and `brew audit --strict` rejects the duplicate.
  # The prerelease channel formulae keep theirs, where the tag does not scan.
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0/jr-darwin-arm64"
    sha256 "2bf902e7d6f9c28dad457db3325d67bad27f054b7983c698c9f0887bf293ec98"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0/jr-darwin-amd64"
    sha256 "f228bc84244537be0fddc425c435b93a1abbcaa4a429337b50692bf619367877"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr"
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr --version 2>&1")
  end
end
