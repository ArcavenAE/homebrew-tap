class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260601.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260601.3/jr-a-darwin-arm64"
    sha256 "5d21363f0217a1ec992c347c7c061dd3508448ede87f7e5255ac8420f7db4293"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260601.3/jr-a-darwin-amd64"
    sha256 "06b7a6c687e3aff5d809924c5539a416b393e64a3667afb0ec301a3fe17747e1"
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
