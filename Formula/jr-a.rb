class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260708.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260708.2/jr-a-darwin-arm64"
    sha256 "4b4d15be680f5a56970a07b5a289b3c67028ecf69768bf235d525254d1b9365f"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260708.2/jr-a-darwin-amd64"
    sha256 "08311f9f4045985f2aee2e80e7042d4b6222de52975866f22f27dba3c2f119dc"
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
