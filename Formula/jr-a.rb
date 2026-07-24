class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260724.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260724.1/jr-a-darwin-arm64"
    sha256 "191c456bb93caa79e8b482b36cbaaf21146289d949d5e4a712f665962c6ace50"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260724.1/jr-a-darwin-amd64"
    sha256 "89e0911d682097b0d28d08b6db5af563a7b40e1f990e692d4af0d58cf4c80a4b"
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
