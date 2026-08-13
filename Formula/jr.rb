class Jr < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0/jr-darwin-arm64"
    sha256 "8aefe3f54075f11c35c13ee45007eda7131620a9c68f2a05af608fa6eed760b4"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0/jr-darwin-amd64"
    sha256 "0904cc9b29136bf6cd5653ad00f29344048c27584e5643a27ce7691bbe6223c6"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr"
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr --version 2>&1")
  end
end
