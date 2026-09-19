class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260919.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260919.1/jr-a-darwin-arm64"
    sha256 "8d948bed5291396f0eaf39f0a2ab2615d9430039c8969e9669fc15472c386302"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260919.1/jr-a-darwin-amd64"
    sha256 "f1185323841ce54db795e8d2cf547d3a6bb9d1094ef8114e5df08ba529442b1b"
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
