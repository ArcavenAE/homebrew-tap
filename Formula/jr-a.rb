class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260528.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260528.1/jr-a-darwin-arm64"
    sha256 "ba6aea0e8a46b670e1aaeb76591349712bc1a5bb2ba528d27410d78c60529edd"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260528.1/jr-a-darwin-amd64"
    sha256 "f8e1bbaf3acd1739763df5ff0f21b6f3645f9ddc12494dcf0fd9ec5d05b61b2e"
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
