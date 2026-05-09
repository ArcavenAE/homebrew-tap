class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260509.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.1/jr-a-darwin-arm64"
    sha256 "23e3c57fa6dc462f67ec4032c97d4885a6d6ecf313cdacd408938084fc23905b"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.1/jr-a-darwin-amd64"
    sha256 "32876d8eb71323a96453b5b4f696236baf9352ee05c77ad208668417057b3c8b"
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
