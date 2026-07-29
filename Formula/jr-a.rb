class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260729.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260729.1/jr-a-darwin-arm64"
    sha256 "073037a31435d024ac24d4c946441ca4350c6ceef8f7809f23afcd2f9c3c94cb"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260729.1/jr-a-darwin-amd64"
    sha256 "a68f5ced18f20bc8c6bf883b07b17d48e635a087c8b16bfe0868d0c39a3794e1"
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
