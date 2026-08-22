class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260822.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260822.2/jr-a-darwin-arm64"
    sha256 "547ae7188eac1d61266268cd047eaa4553d8c74dc823de3a48a3a48d2d491cac"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260822.2/jr-a-darwin-amd64"
    sha256 "47dd25fce9d30d5c5beb0d1c2e8e93dd011217af3b58093ff45cbe1a051d8c68"
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
