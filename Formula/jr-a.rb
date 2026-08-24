class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260824.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260824.1/jr-a-darwin-arm64"
    sha256 "d0964497492909bc45eb80cf14d755d4ea8d440418c84eb78be2af04ef194463"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260824.1/jr-a-darwin-amd64"
    sha256 "5663bb56dbbb575bf8ec598c6241fe208c8229bfadddfc33a8b98dd8ada8292f"
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
