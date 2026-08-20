class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260820.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260820.1/jr-a-darwin-arm64"
    sha256 "215aa463ae9021a98ef4ae3a4be8b531330a4bb45508ae7174c14f79255701c2"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260820.1/jr-a-darwin-amd64"
    sha256 "4860caaed1d65a10a01131116c004d37a669945d505a2d15941e5e58b88eaf25"
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
