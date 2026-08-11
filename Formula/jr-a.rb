class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260811.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260811.1/jr-a-darwin-arm64"
    sha256 "73ca652f7f12986aca5866766b056e87d584cb4c19fb67745e919e2132f45986"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260811.1/jr-a-darwin-amd64"
    sha256 "46479794b72711d189ed777eee88f9f6ea020050f9b603de29d871ecc2d23d11"
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
