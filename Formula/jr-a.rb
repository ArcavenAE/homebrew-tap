class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260911.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260911.1/jr-a-darwin-arm64"
    sha256 "f8b4bb7e046f5db5947579f895e94d2d51c8b7cad084fc995902bf3f03881fc1"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260911.1/jr-a-darwin-amd64"
    sha256 "a224b6b6b4ba9ea2f1947f9deeace8d8acf2901a1478ce1c278532e354e33687"
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
