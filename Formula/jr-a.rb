class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.4/jr-a-darwin-arm64"
    sha256 "53bf0cdf8c0f4e59ddbfc9e51a226e7f3886687bf7acb34ec31495c1c0de6f2e"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.4/jr-a-darwin-amd64"
    sha256 "345e2e99f540a6740720adf3ef35b43a363b634829b9cabda82433d88e87883c"
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
