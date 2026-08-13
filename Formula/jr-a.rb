class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260813.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260813.1/jr-a-darwin-arm64"
    sha256 "0c8124ffc56d382b57995e197aec5780abaee80a0a9b68b8a5e1b0376712c834"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260813.1/jr-a-darwin-amd64"
    sha256 "55617854a4d8dc9f7b18dc5ec9bf0dcf27945c8d12027442c87e40a8e6a001a9"
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
