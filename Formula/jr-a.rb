class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260902.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260902.2/jr-a-darwin-arm64"
    sha256 "ca3c6a60c004505d67e0340b9211fa31264a24584c1f32d32bc6fdfe3ca2d5cb"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260902.2/jr-a-darwin-amd64"
    sha256 "1d291e9ed4ce883392a8f2e26120914c40aa919e8ea5a247c2e1e44c37c85c9d"
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
