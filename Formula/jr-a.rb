class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260625.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260625.3/jr-a-darwin-arm64"
    sha256 "69daa20de7b0a0574bae5099adad4b4ac64e622b1e7bb48aa24ad3b62b566bbd"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260625.3/jr-a-darwin-amd64"
    sha256 "74ded27de2f24baa62630dda953956c519bbe5646a6fe2a3478adaf7f2067463"
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
