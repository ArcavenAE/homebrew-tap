class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260620.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260620.1/jr-a-darwin-arm64"
    sha256 "2f043d14772acebd622027ea08378a9ed4929f2a2cebbc68097adc0c35f0933b"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260620.1/jr-a-darwin-amd64"
    sha256 "7df19d265ebcc44dfb297126e0aae0d7a7997e26162dd6bb061c2ceb992e58da"
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
