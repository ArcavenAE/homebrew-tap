class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260515.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260515.1/jr-a-darwin-arm64"
    sha256 "07219d45c75ba6c6257dc8a5356909bb562d4c618f4b41f713c39588ffacd189"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260515.1/jr-a-darwin-amd64"
    sha256 "e931e83fb7dc149a9132e9ab9bdf4ade88ae08c85d37f5e4b5914ccbf97698e9"
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
