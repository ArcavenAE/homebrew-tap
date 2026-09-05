class JrA < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Keyboard-driven Jira CLI with offline support and fuzzy search (alpha)"
  homepage "https://github.com/ArcavenAE/jira-cli"
  version "alpha-20260905.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260905.3/jr-a-darwin-arm64"
    sha256 "e0b03b5c1cc446c653e33828f933241732f71ae6cc41a26fe3e3c0ee93452ed8"
  else
    url "https://github.com/ArcavenAE/jira-cli/releases/download/alpha-20260905.3/jr-a-darwin-amd64"
    sha256 "1c04b4931ebcfa4e5adbbffdaf4ee310102f84cd8bf9417c251b3608ff7ae21b"
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
