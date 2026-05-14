class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260514.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260514.1/jr-a-darwin-arm64"
    sha256 "526daeec6690edabf09a74306bd3fe70e9c13addb80a493b5a432a3f6ba9a1a6"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260514.1/jr-a-darwin-amd64"
    sha256 "55c73ea92e7cf77d18ce614b5d96002eb1b010eb1224090f6d084ad82a605b13"
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
