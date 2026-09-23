class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260923.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260923.4/jr-a-darwin-arm64"
    sha256 "9fb54ad073739b44911066864a3b74566c07a2e00cf1f1d7d076527b2e05f768"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260923.4/jr-a-darwin-amd64"
    sha256 "28d24be21652f9ff31e2a104314433ee64271bf0b46f8c032136e52a2d882545"
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
