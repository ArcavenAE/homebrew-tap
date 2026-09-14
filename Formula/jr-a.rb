class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260914.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260914.1/jr-a-darwin-arm64"
    sha256 "a1c1d4613ee433faa8d17cd6dde34db64ac42f18ac483fe8eef684dc152f6b74"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260914.1/jr-a-darwin-amd64"
    sha256 "97210c13af1ceb4dc690b4cbe69b2f072cc315e1b0ca4385a070e6e7e2002faa"
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
