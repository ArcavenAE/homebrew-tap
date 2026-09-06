class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260906.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260906.2/jr-a-darwin-arm64"
    sha256 "537db1b7c3757353c2a2c8e1703a7e4a66b6f6db941625a81072ad90a5ada2e7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260906.2/jr-a-darwin-amd64"
    sha256 "cbaba7a3e39d5b67f08571eb623bb62e87e1b74e80487c9b90fa23de4feb44c4"
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
