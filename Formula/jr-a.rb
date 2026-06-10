class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260610.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260610.1/jr-a-darwin-arm64"
    sha256 "3da05d15db6c85e64040c24b71b5fab4aec561f3e55432262fa9d9ac7938c8c5"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260610.1/jr-a-darwin-amd64"
    sha256 "8ae7a75186e559c5dfdaddbaec2740b1698222c97c2b9d6a3973ffed904a73e8"
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
