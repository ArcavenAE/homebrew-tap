class JrD < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (dev)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "0.7.0-dev.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.4/jr-darwin-arm64"
    sha256 "1a89f6e4c53365d59bbda7844b6d46144f1039f8e730df68ddd7008c451e8a91"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/v0.7.0-dev.4/jr-darwin-amd64"
    sha256 "6ff2fde395b830f3d80e463eb33da09958de9caaa60c43d1010552b71c0714d9"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
