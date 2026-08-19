class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260819.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260819.1/jr-a-darwin-arm64"
    sha256 "cc9516663f5cc9487c4de1236f82040cd7ee5cee20c291b4556122ea976e7e97"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260819.1/jr-a-darwin-amd64"
    sha256 "a1dbe5070e6089334ac45466cec3f5239749d164a6ac98bf4a697eca6bd6850f"
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
