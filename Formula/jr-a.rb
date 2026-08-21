class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260821.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260821.1/jr-a-darwin-arm64"
    sha256 "31317cb56e4fbd5dde16cb596247c49b1dc5d212d054299b4a91c20633f99b7e"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260821.1/jr-a-darwin-amd64"
    sha256 "1d0ee5bed82dd6d92efaf3d7961c9ac18785ad713352efed7d8fe23f17b39a94"
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
