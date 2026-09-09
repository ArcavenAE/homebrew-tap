class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260909.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260909.2/jr-a-darwin-arm64"
    sha256 "aae9f565948f26da0cff8101c2643f97762308259573d60e6ccf43820e1bcb8f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260909.2/jr-a-darwin-amd64"
    sha256 "9eb16f2d5ad1ec02b19b2efcd09a643f046a11d80a672d9217a95f04aa7e0773"
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
