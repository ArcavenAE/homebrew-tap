class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260814.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260814.1/jr-a-darwin-arm64"
    sha256 "819459a74d2316e5a845fc755f308f1aa6890980b06bd014a29f703f28c02721"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260814.1/jr-a-darwin-amd64"
    sha256 "4a40e3cd4a9b5d0c6aff182a0f8bad94caa8d435e2d104e206ad973984112b72"
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
