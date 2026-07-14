class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260714.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260714.3/jr-a-darwin-arm64"
    sha256 "97a8429fcd771a87cfcd4852eab0bab05d1c2fa0b9758c3187c28b401adaa667"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260714.3/jr-a-darwin-amd64"
    sha256 "3b8cf646ad512e760364c2ec137fd7a5bb0f248388e213d2b3859f4a787029fc"
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
