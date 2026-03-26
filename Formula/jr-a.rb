class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.9"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.9/jr-a-darwin-arm64"
    sha256 "ab731bf0d4ba8e6d4912db0897e7a8ccac3ef33e3ce56311d8597d03b05b9e4a"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.9/jr-a-darwin-amd64"
    sha256 "35db82fd45086d280b5b3504b5cc917ea53efe9a542226a871361bb923fa30a8"
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
