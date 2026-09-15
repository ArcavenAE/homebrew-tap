class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260915.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260915.3/jr-a-darwin-arm64"
    sha256 "9760dcaef5da0c3485d0c2d9e72a9f25d3cef876d283699919aab42c80ddb0e9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260915.3/jr-a-darwin-amd64"
    sha256 "5fe856043acbf953508a44af92ba42a7413575a738f9acb2ecb4825a70e105ae"
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
