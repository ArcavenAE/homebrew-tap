class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260709.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260709.2/jr-a-darwin-arm64"
    sha256 "147026df6ca09df466c751b17fba585cd800b04059495c49f46b49130d914342"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260709.2/jr-a-darwin-amd64"
    sha256 "ce074dfb9d1de7231b033900eef5f48835d5513fdf23f2f867fc57d4e99e05d2"
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
