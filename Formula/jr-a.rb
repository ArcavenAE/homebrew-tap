class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260624.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260624.1/jr-a-darwin-arm64"
    sha256 "5c87ea7bfaea8ab4705edca4d50617407ef3228b03a0447cc551af650ec9dcd9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260624.1/jr-a-darwin-amd64"
    sha256 "be5d01cd001db382baa9647dbbaaf668dd62efe097881781cc79c5f60014dea7"
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
