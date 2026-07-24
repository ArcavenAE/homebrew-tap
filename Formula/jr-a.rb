class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260724.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260724.3/jr-a-darwin-arm64"
    sha256 "8d80aea4b1965002199f18706acfad1272944565784d062b0c869845cc2f21b5"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260724.3/jr-a-darwin-amd64"
    sha256 "538cf02854cb8bdeb390bbb559e7afb8cf7c8c2fd0afd589adc47d4f5ca8cf26"
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
