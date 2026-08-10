class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260810.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260810.1/jr-a-darwin-arm64"
    sha256 "fe68d763dff5a29826bdcb9a36d6847b7e7b284333a08c9e0a6dc72dfd54bf23"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260810.1/jr-a-darwin-amd64"
    sha256 "ccf4010e29e811bc86e29faed30703c0c36df7212c76e0c075b0f3eac57fa69c"
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
