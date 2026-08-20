class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260820.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260820.4/jr-a-darwin-arm64"
    sha256 "748ce177f5cfe2bcd7b784d38339f9a8b305ff089309ec1265f49b98688b1c04"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260820.4/jr-a-darwin-amd64"
    sha256 "276419a886db8781b00e99e24dad863f3e116b92c402cfb735a95538c277aa40"
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
