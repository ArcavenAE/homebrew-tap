class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.12"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.12/jr-a-darwin-arm64"
    sha256 "7bbef06da44ec9f4fcd3a524146f2e6a8f9a2b32e9d639de56bf162977d9be8f"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.12/jr-a-darwin-amd64"
    sha256 "4abc0381b814fda5c9343c430abf81b553640a3203cca8616eff817bdbeeeaed"
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