class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260716.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260716.1/jr-a-darwin-arm64"
    sha256 "352076a2b065f93db25b138c03bfc8f8263030a94b3d1aed2f7633a053fd8762"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260716.1/jr-a-darwin-amd64"
    sha256 "3d0bbdf80fc5ed511aecabad1ae8811b98c2c0100ec8772c4f1ff827680a7f62"
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
