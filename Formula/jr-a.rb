class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260418.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260418.2/jr-a-darwin-arm64"
    sha256 "2fa3e6fc41311de0d4aa69aac08ef65b5a161261b200ab80f5ad472eab551274"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260418.2/jr-a-darwin-amd64"
    sha256 "d1e3ff6c0af4b2031a42df18218719b9f91e3be2ba96e860633a53f2d1b06294"
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
