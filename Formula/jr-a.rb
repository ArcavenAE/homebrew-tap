class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261003.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261003.1/jr-a-darwin-arm64"
    sha256 "49f8bdda504f66c0f5e8cbcebfc7673eac00c8951d4350be262e682b12f3fe4c"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261003.1/jr-a-darwin-amd64"
    sha256 "67625b59c6f7a5762d175c766327022c12e8ad9e189b7ee0261a04f8de23b70e"
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
