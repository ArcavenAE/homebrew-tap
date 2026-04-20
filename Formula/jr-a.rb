class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260420.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260420.2/jr-a-darwin-arm64"
    sha256 "2bbf502f562fabbc23db9e847f4f677d6b20dab441fb21c4835bb1c6e3a42662"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260420.2/jr-a-darwin-amd64"
    sha256 "f7206e68aee0f283b0114f34ff0c84d6a6df37645a4493a193843659972d2f2f"
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
