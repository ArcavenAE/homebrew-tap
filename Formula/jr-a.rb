class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260723.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260723.2/jr-a-darwin-arm64"
    sha256 "e2a85909aa9ef41f76b6dacfbe31b07544957eb5dc4e5e4b3a4e56a96d46d893"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260723.2/jr-a-darwin-amd64"
    sha256 "340bc6394d521b408037c8a966dda342c8d7a63071a4b051ec2c86b0bb2213d7"
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
