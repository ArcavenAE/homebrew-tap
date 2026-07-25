class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260725.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260725.2/jr-a-darwin-arm64"
    sha256 "f2389715dda545a694098f6b623740f80710fcb32821369915bf9d96edaabb95"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260725.2/jr-a-darwin-amd64"
    sha256 "a833f9cfef9bcb7b9cbb3e7b3a84ccb49cb872156ea495c962e81605af9ca800"
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
