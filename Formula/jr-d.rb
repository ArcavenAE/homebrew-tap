class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.7.0-dev.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.1/jr-darwin-arm64"
    sha256 "6d37ec5c1377abcc1526389ab4eae74df134564ac2c741b10f1b47a00ced6b84"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.1/jr-darwin-amd64"
    sha256 "fcd66a3d50732b781540ce66bab4b2d733f62b8aef1d53dc12fddebe6399b0a9"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
