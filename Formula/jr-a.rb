class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260825.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260825.1/jr-a-darwin-arm64"
    sha256 "5d18caf4276480d618ce22adb457106221fc1c5fe66807dbcb2e00951d81f75f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260825.1/jr-a-darwin-amd64"
    sha256 "a55c70970514a04568ba0ed37a1b6e0ac24226ce360f13f586412e01b72ae4e0"
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
