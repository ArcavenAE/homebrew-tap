class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260713.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260713.1/jr-a-darwin-arm64"
    sha256 "d486d2b0d8d284087f51e48635d70190c85549ecc085dfd186890810f3d47460"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260713.1/jr-a-darwin-amd64"
    sha256 "1780da7bc5135e967ee39e5549de40017b62adb9d72ddad418a5c3ca653e7fcb"
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
