class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.6"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.6/jr-a-darwin-arm64"
    sha256 "6d591a8259332662551662b88d9014640649269a51d22c965bc1c9e4210f5f60"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.6/jr-a-darwin-amd64"
    sha256 "c0edbe21f63cbe39f77d888ec86ae61c56412fbad0a22e7cd646f570a57d5663"
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
