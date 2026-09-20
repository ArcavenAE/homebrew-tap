class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260920.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260920.2/jr-a-darwin-arm64"
    sha256 "7a9c0182803dfd30ac2942c5a17be8479114d4d47beedf79ad941d711748a122"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260920.2/jr-a-darwin-amd64"
    sha256 "6a7b55a5c7b5be53529dc0f97b403ca7754eaa702dd9add9034ec581c0a39e1d"
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
