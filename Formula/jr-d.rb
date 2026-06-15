class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.6.0-dev.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.2/jr-darwin-arm64"
    sha256 "58259f69ab025cecde173233935ebafd969fa39c907f24cd10f128903e89eeb1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.6.0-dev.2/jr-darwin-amd64"
    sha256 "f70e865097a715f8de52c2953a77f21b27f9936bdd9f1810b482c1cafa9e238f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
