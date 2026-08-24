class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260824.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260824.2/jr-a-darwin-arm64"
    sha256 "7d728230a9507eb4358a598a35abfc44229dc4dfb1f8e01f24b12ea77c5e6107"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260824.2/jr-a-darwin-amd64"
    sha256 "2b6d83cd40986075a1396c6e16fa1382cfa86c374b6d90f76e5ee62730e28fb7"
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
