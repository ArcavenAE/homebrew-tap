class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.7.0-dev.8"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.8/jr-darwin-arm64"
    sha256 "f07caf181b5f8772e807d6129481bea090ea4f2c03257f58cc323152ecbb0633"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.8/jr-darwin-amd64"
    sha256 "187fa738fecb5c3e0c3eaf364530b9ddd0e54917ee30b1973d21fd497317ff16"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
