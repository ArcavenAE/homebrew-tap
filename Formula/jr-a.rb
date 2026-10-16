class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261016.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261016.2/jr-a-darwin-arm64"
    sha256 "9d18b1528faf9afc0ebde0703d8df8578037d8ecb24649eb33208d9ad754bb46"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261016.2/jr-a-darwin-amd64"
    sha256 "57294ea45e27520b1fdbf02d50290e90688598bc21fb4d0429fa73cd8787cb05"
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
