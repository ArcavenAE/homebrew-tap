class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260915.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260915.2/jr-a-darwin-arm64"
    sha256 "3e03ba7f695110bd0a180053c524db3eeb5c2693768e9aef3fca502f0ae2315d"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260915.2/jr-a-darwin-amd64"
    sha256 "5b7962b21ecc262596ec770d7f78d447fc2aec150de675b15bc09dea5af4c34b"
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
