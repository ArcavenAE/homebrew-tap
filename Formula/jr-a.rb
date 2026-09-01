class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260901.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260901.1/jr-a-darwin-arm64"
    sha256 "1b54e73fd72c5ee4cfa3d96c70e39aa9d215c227b8aa352b762b73ad6bf5a8de"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260901.1/jr-a-darwin-amd64"
    sha256 "d8d1b35231f486834da8998d4d4e924c6bf0159a5635f069f78be8008bf19c41"
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
