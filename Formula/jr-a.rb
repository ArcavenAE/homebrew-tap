class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260623.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260623.2/jr-a-darwin-arm64"
    sha256 "e46fdfd631aa5e418459def555385e3ba9e07377c082322423d4e41fd896f927"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260623.2/jr-a-darwin-amd64"
    sha256 "53778f4082709819861632d8ccccea19707ead579fcf246ddd14db82dcf0d708"
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
