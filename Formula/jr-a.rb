class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260618.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260618.1/jr-a-darwin-arm64"
    sha256 "6db45d85f3e6d2db7aa3fbfffc43715239b353c6e42548185ded87aacb6e03ad"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260618.1/jr-a-darwin-amd64"
    sha256 "95b3acd70f48246534c56eae5e67cb51739a900d0cfe0c1f4a370bc779b0b33a"
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
