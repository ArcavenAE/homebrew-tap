class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260423.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.4/jr-a-darwin-arm64"
    sha256 "7eb4c17017fc4843c3f54e70bd7a8d263c459fd9bf4b25bd4801345996d49c38"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.4/jr-a-darwin-amd64"
    sha256 "28c6dc7caa34554479679ff24562fc11d105a1898f1e7fbd41366b0b76b206aa"
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
