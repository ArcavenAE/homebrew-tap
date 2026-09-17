class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260917.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260917.2/jr-a-darwin-arm64"
    sha256 "59a760dcc31e6cd5f4721b4318ee8932bde49c0f1b379d1f5255c2bf75418449"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260917.2/jr-a-darwin-amd64"
    sha256 "0f30c493dcd8d70a2bb8359c26af631657b87f955e7e8f9edd56bb8c4333d47f"
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
