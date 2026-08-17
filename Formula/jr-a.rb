class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260817.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260817.3/jr-a-darwin-arm64"
    sha256 "a0f7dd80772c448e064192889e4773464f6c188c60bbdf7ce7f32442a36ae9e3"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260817.3/jr-a-darwin-amd64"
    sha256 "d8d26a35c4767416bcae896e0c01e372fb4e8c9d6751ce9258e183c052b5706c"
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
