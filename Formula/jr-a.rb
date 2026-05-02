class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260502.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.2/jr-a-darwin-arm64"
    sha256 "1260ca79938b359e1c8a1b5f83de4e961ec2c8f324f74cc275a70b9457dd3987"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.2/jr-a-darwin-amd64"
    sha256 "fdea94226dbb1d37c89c70d6724073b0865bec57ed74e855a5693aaf9cad4d21"
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
