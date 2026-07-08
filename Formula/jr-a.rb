class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260708.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260708.3/jr-a-darwin-arm64"
    sha256 "20812e3be428cd01be5213029642774c43aa46d8ca94dfb415cc8acb7284eb85"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260708.3/jr-a-darwin-amd64"
    sha256 "ab0a402175a8934b98c82206581d86af821d4484fcd1d63bd7c29accbf1152ce"
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
