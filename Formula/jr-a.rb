class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260626.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260626.3/jr-a-darwin-arm64"
    sha256 "6d18ad3f356d4eb1914d8b524e2617898b02e7ab69f71bd2e6a59dc39e51eda0"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260626.3/jr-a-darwin-amd64"
    sha256 "91a7e0d0eab524ab63c033efb38152990f368a8d7038db4648cc440477cd0803"
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
