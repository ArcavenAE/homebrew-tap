class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260608.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260608.1/jr-a-darwin-arm64"
    sha256 "4a97e55fa5396eed48af8f1fd886e99e2bc92638e43d02ea53e5823c24a650ba"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260608.1/jr-a-darwin-amd64"
    sha256 "3365c9cd98f36cecf1db4dfeb1104bf80f2a6ff15028f99eecabc98ef47acf19"
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
