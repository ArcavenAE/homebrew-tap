class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261016.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261016.1/jr-a-darwin-arm64"
    sha256 "7b648eb679a06e7baf9fbea900aebacb10c68e0e6d96109f195ac96d593d5150"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261016.1/jr-a-darwin-amd64"
    sha256 "00853b185a90ed028ea97074d303fcfab25818af320e6ae556f65ebd90ded52c"
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
