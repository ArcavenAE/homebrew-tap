class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260626.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260626.2/jr-a-darwin-arm64"
    sha256 "1efdf4d595f69d6cbd2a69363ac27e4e1664ed9b086b7f286210018b7f630728"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260626.2/jr-a-darwin-amd64"
    sha256 "f30a00300cf7fd5ec4959eddf17ccfd8d2b9788ba1bf0a107be9059830497e79"
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
