class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261020.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261020.1/jr-a-darwin-arm64"
    sha256 "4f5dde9f40845a494166c6d5dd0566a594b24caaa4a043f3f42472a60066caec"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261020.1/jr-a-darwin-amd64"
    sha256 "228e79accea6dd2563b13bff8e5bb70f18e09e615c9980efcf8b105a4d93e496"
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
