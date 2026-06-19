class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.5/jr-darwin-arm64"
    sha256 "648558d18debab35d6d503da50f5960d6df1f062b9b14d35de1b33eb1d9122ea"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.5/jr-darwin-amd64"
    sha256 "53a14e754e452a086c82658cc07490b41100342896b8e2654cf77fbeb76f5adf"
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
