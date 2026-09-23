class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260923.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260923.2/jr-a-darwin-arm64"
    sha256 "4ccb1ad9844b25edd3ee6b116ca605771648b52a2ab18ffc5aa9efac257858a9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260923.2/jr-a-darwin-amd64"
    sha256 "7c6b3f128a4a91009eac883a6f7ce901f9d006d90427556b070e4bf78f658636"
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
