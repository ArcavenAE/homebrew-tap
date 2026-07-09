class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260709.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260709.3/jr-a-darwin-arm64"
    sha256 "1bb3027fb9dfd2e89a41e492863709e14db61da1df13624b6820aac9221bdf4f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260709.3/jr-a-darwin-amd64"
    sha256 "7353e790e16d16df1b28ddfa1239aca6815c1107935920996095c5827cbed9f5"
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
