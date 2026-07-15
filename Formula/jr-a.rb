class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260715.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260715.2/jr-a-darwin-arm64"
    sha256 "dffd19d2c19e3c9c471048c0141ab5e392b0e2d77481fc1bb59bac1bbafcc849"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260715.2/jr-a-darwin-amd64"
    sha256 "4ca6f548afaeba54d8ac114bbf60cdfaf1ba716fe09944d4f870a56241254f79"
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
