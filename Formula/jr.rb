class Jr < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.4.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.4.0/jr-darwin-arm64"
    sha256 "5185dbb95ccebdc6cdf802de247bd4efbcf2897718357126b4efa7d49c63dd18"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.4.0/jr-darwin-amd64"
    sha256 "ead4a665ed5e312a972c045c6172e9dedd5d04422e4b83dc88fa8f22706936d0"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr"
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr --version 2>&1")
  end
end
