class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260331.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260331.1/jr-a-darwin-arm64"
    sha256 "f882cf640fcc8518b04b9b50f26f17dc1b55755cf93a197591bbb0f0b6ddcb4b"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260331.1/jr-a-darwin-amd64"
    sha256 "4f79be9300f3aba4ca3c612393aab7183000aa839119c909ec3701546a82d2ec"
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
