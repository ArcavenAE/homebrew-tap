class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261001.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261001.1/jr-a-darwin-arm64"
    sha256 "c14ed269b9c324a36c9f94ce74e54dba0796b20c5e2d8f84c19458cc55abdba1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261001.1/jr-a-darwin-amd64"
    sha256 "84ec8a49ecfeb05d52c8889d4ce8218d061c6295ee36d54259b3313267637391"
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
