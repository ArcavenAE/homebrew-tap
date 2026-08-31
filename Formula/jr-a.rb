class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260831.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260831.3/jr-a-darwin-arm64"
    sha256 "b3d9c3e39f2593dd6efbe286c5d0165a736fb91c567d29b92b90250c6e980fc7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260831.3/jr-a-darwin-amd64"
    sha256 "951fc34240afa7fb0739a5221cd24e8ce32573a1c7a54d6a76245d3a457b216b"
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
