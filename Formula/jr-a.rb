class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260903.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260903.2/jr-a-darwin-arm64"
    sha256 "16c70a37249ef0e1cacd060f4c7ce05543e96968a34ecde476686f6b265da926"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260903.2/jr-a-darwin-amd64"
    sha256 "58f70b6469903b528be1662a006a46b74284e9eb7c9a288bb183eeb382f3ae79"
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
