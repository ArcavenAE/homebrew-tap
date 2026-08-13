class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260813.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260813.2/jr-a-darwin-arm64"
    sha256 "4b1b3693f1699eda064c77c279ec356a914b1318565d5c240bcc1dd9dcd2af11"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260813.2/jr-a-darwin-amd64"
    sha256 "5af793140201f7ec3807b4976522bd00fa2943673e71c22237eda7dc5ce3058b"
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
