class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20261002.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261002.4/jr-a-darwin-arm64"
    sha256 "ccf9028751a7b684a7d316469b48c54b6eed6b571fbaa873782bcc871079903d"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20261002.4/jr-a-darwin-amd64"
    sha256 "736b413aa0daa198f30fbfca9929f2ca367d42dc6da53571907f151df56929cc"
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
