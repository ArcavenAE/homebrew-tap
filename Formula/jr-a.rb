class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260512.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260512.1/jr-a-darwin-arm64"
    sha256 "8426ec0f71e4a07c2b633de63d26e4f06f84e7a1d5c509be7f34e76cb13eff51"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260512.1/jr-a-darwin-amd64"
    sha256 "bd47187316cc906964eab6a1fe2883424ee8b2a7e80432cb62ae570bc8ed785f"
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
