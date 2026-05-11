class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260511.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260511.2/jr-a-darwin-arm64"
    sha256 "b2087871425612359851389f8cfa375a1a3a27ac756a98c1dfde15281dfe1137"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260511.2/jr-a-darwin-amd64"
    sha256 "264f25680b0c2176871964019193ee21aee966d1a98ed3e9f6212f2fa15f5978"
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
