class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260423.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.2/jr-a-darwin-arm64"
    sha256 "8a9e1c75e66111f930fd0a590703b6dbb1e9d2aba5e7fd10948c4ee85f0b4dce"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.2/jr-a-darwin-amd64"
    sha256 "c7cdb31ef5209bced0dfbffc2bb26fe090b20e3a7c710897ee989a137c68e54a"
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
