class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260418.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260418.1/jr-a-darwin-arm64"
    sha256 "cd096d49a19de1119f64301af43ca119897c1b20d708a24bdcbf3f5e023e7fcd"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260418.1/jr-a-darwin-amd64"
    sha256 "585f4a952dec77a9a7373ab0649baa0bc79b06cacba5dcc1e95e7437b83dc390"
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
