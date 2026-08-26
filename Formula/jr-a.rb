class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260826.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260826.1/jr-a-darwin-arm64"
    sha256 "5014b06cb4fe5d6adee0306ad770c08bb5cd2ac20f7d20962342206d9cf882c4"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260826.1/jr-a-darwin-amd64"
    sha256 "84dce65c7e1da916efc99e914251168f2edb68d51656bd4d39abdbd6a3452c12"
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
