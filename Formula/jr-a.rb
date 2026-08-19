class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260819.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260819.2/jr-a-darwin-arm64"
    sha256 "177b26787b291dc7c16445841bcfb6fd7c9573785a4f8ba75e6f8a561935e3d7"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260819.2/jr-a-darwin-amd64"
    sha256 "6134896bf0e7bfd993d3277fece20a3ddd4960901ac01a865b7f2a9a6e389683"
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
