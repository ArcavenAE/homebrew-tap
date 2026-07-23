class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260723.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260723.1/jr-a-darwin-arm64"
    sha256 "444fa8cd5ccfd1dbf575cd70711d2f97c2881442b0eebcecf74d6820143dfdbf"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260723.1/jr-a-darwin-amd64"
    sha256 "7d542291e639611af5cbacb5e4327b6258ffdcf7fec284ea6a236f5793cf4149"
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
