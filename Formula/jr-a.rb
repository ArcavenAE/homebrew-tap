class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260818.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260818.2/jr-a-darwin-arm64"
    sha256 "a7a324f0144b09d06e009084915e7a69361e9204d514f09b47d16c36205b3979"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260818.2/jr-a-darwin-amd64"
    sha256 "a4cb36d86ccb97e0c230ac9ca31bf70952b9046dedfd896797ed7d2252ad0ab0"
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
