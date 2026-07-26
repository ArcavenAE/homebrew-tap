class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260726.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260726.1/jr-a-darwin-arm64"
    sha256 "968f9bfd01a1b4851bd9f7526719abbb49be4d6bf7dfbce3cc2f0e82998afefb"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260726.1/jr-a-darwin-amd64"
    sha256 "20e2831eb7a2105183820f6ca2134a92e51c607d36cb0512d593fc83b4330d23"
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
