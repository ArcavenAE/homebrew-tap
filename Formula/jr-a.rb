class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260902.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260902.1/jr-a-darwin-arm64"
    sha256 "0fc6d8eda87bc91ff827f819a5e3bd01d18c86ff4671085e248f3d1b40d65ad1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260902.1/jr-a-darwin-amd64"
    sha256 "b4246e09c2289b2b82c4ed0c001f6c738df2736cfac1488130487f1eacc1c8b1"
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
