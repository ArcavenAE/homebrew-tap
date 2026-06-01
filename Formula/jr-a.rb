class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260601.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260601.2/jr-a-darwin-arm64"
    sha256 "d1c69194bd4437079287bb0344f432b96345149fb82f145010a07b2f64591442"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260601.2/jr-a-darwin-amd64"
    sha256 "aee3532736f223eb606594f3b67e49fd705ec6b604753427456cc4f9075f8460"
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
