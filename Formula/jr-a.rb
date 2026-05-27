class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260527.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260527.2/jr-a-darwin-arm64"
    sha256 "1860cbc02684ae512603b556367e8ba63185272d90ce11e14ed79dc3bf81f287"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260527.2/jr-a-darwin-amd64"
    sha256 "839a8fe5fad4598b021d501f429472cac5794fa07a6fd61a3874b08e6262f606"
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
