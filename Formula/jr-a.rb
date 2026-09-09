class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260909.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260909.1/jr-a-darwin-arm64"
    sha256 "fe17e74fabcce3bb0da8509770142082d5fa3eb40969fd0294f119354587dd86"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260909.1/jr-a-darwin-amd64"
    sha256 "9cd2f83831005b0276bfa680ba3a2338a4a62c36b23b0d03aaad69eb37fca3f4"
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
