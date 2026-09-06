class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260906.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260906.3/jr-a-darwin-arm64"
    sha256 "8694c932f2326b81f9953d256bec0638c80c1fa45e19c15df1aaacda6f2beac7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260906.3/jr-a-darwin-amd64"
    sha256 "5fb4d3ff8d6a1c61ea51584a9c19532505a05f9cde09e546a0c63029b3058415"
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
