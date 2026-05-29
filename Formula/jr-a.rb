class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260529.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260529.3/jr-a-darwin-arm64"
    sha256 "a89d0aec8568497979f083343267a2d4e6dd1050eb4ed6bbc755eb2c9a6d7357"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260529.3/jr-a-darwin-amd64"
    sha256 "68d4090fc3882d1d001e7a87f42043e1137cdbae3eedc3d2490a563f622b7508"
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
