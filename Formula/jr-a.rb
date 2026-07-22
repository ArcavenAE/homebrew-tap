class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260722.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260722.1/jr-a-darwin-arm64"
    sha256 "b382455eac690981534181a4df5453d728f12dd490d1767cf22621ecbd9314f6"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260722.1/jr-a-darwin-amd64"
    sha256 "0d2e7c9c2732838aea5e8559d491191e5f7f1e7f3d0f0dafec2a8ee102f00032"
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
