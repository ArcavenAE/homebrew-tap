class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260619.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260619.5/jr-a-darwin-arm64"
    sha256 "7ab6b060ac0ee2b0ddf40b38ced080da225019cc68fb80bf0a620e73adb9b357"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260619.5/jr-a-darwin-amd64"
    sha256 "0823caf1a85fe6d0dfc69a19a0ea722782c8d98f483f37305f45ea3bb748fc14"
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
