class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260916.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260916.1/jr-a-darwin-arm64"
    sha256 "97cb731f3ce571aa973a01dfeeae3753e98c6f853bec97eb675bd93fdb0f61f9"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260916.1/jr-a-darwin-amd64"
    sha256 "fa6b2b5b70edd8c190e2426af36a18b184c17ee71c06c481353cb95b0c97a1c2"
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
