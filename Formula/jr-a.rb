class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260405.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260405.1/jr-a-darwin-arm64"
    sha256 "f5ee35998b2f7f58bd3ff7e61b42dcd3a5cc130c0231d259d542aabd88b6b5e3"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260405.1/jr-a-darwin-amd64"
    sha256 "ec56933a23139ed786eb91c32b49eaca9f29dd27f3e4f8f14527717b075d16a9"
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
