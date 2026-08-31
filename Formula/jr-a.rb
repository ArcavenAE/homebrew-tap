class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260831.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260831.1/jr-a-darwin-arm64"
    sha256 "6e327d1837384fa326d5af8896f0a01e3200cf6837797be57ef0d219abfa98c8"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260831.1/jr-a-darwin-amd64"
    sha256 "33036bc3a1018c8952b56e201c8a52b5c61a1f1dae23bd5393dcb7ecd2f85fb9"
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
