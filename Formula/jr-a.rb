class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260518.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.2/jr-a-darwin-arm64"
    sha256 "6f73aaf6ecd209b35d873b61a098d5778ee6eb9ce167d472a952a7c341fd2687"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.2/jr-a-darwin-amd64"
    sha256 "a4c45e9f306eb60af25195fadeae3dcae78e3be633f3ded9b0985387c3c82473"
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
