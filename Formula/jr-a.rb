class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260818.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260818.1/jr-a-darwin-arm64"
    sha256 "323a5a593ff36e183382713ccc87bd7802b3963023572883ce1a4540f933b8f9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260818.1/jr-a-darwin-amd64"
    sha256 "6f8d776486621f5271dd90eb0670c7490cea3c7bace7033a391474930a6f70ff"
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
