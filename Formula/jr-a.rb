class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260901.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260901.2/jr-a-darwin-arm64"
    sha256 "0e302eaa5bc890f174f6f683276a569bf9bdbb52ac5588e7f984465404b283cc"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260901.2/jr-a-darwin-amd64"
    sha256 "890a5ad057304d9dcea469b55c43ee871a5edf1a54c8bf6fe9af4e2d26d981ee"
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
