class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260527.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260527.1/jr-a-darwin-arm64"
    sha256 "bbf37931523c4998649895a1cf9115c2f7f01c182f40e3c09e139d25c2af765d"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260527.1/jr-a-darwin-amd64"
    sha256 "03d30dd2700eb891333839f95ab65daef268f961e67e99bae6f9b83a3b8dd372"
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
