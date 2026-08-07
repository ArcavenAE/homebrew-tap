# Homebrew formula for stave
# Single channel, kos pattern: updated by CI on every push to main
# (alpha-... versions) and on v* tags (stable versions). The same
# formula tracks the latest published artifact, alpha or stable.
# macOS only (arm64). Linux support is a future option.

class Stave < Formula
  desc "Unofficial CLI for the Wiz API (not affiliated with Wiz, Inc.)"
  homepage "https://github.com/ArcavenAE/stave"
  version "alpha-20260807-081623-30f8c21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/stave/releases/download/alpha-20260807-081623-30f8c21/stave-darwin-arm64"
    sha256 "7ac4759c309de9ed7454c7bcc53e49179af3724fe609d5ad4be3ed70ab33c339"
  else
    odie "stave currently only supports macOS arm64. Build from source for other platforms."
  end

  def install
    bin.install "stave-darwin-arm64" => "stave"
  end

  def caveats
    <<~EOS
      stave updates on every push to main (alpha versions) until the
      first stable tag is cut.

      Bootstrap credentials (recommended; the client secret goes to the
      macOS Keychain):

        stave auth login
        stave auth status

      Discover and invoke operations:

        stave ops list
        stave api list_issues --var first=5
        stave list issue --limit 5

      stave is read-only against your tenant by default; GraphQL
      mutations require --allow-write.

      Every API call writes a structured JSONL audit line under
      ~/.stave/audit/ (macOS) or ~/.local/state/stave/audit/ (Linux).

      stave is an unofficial CLI for the Wiz API. Not affiliated with
      or endorsed by Wiz, Inc.
    EOS
  end

  test do
    assert_match "stave", shell_output("#{bin}/stave --version 2>&1")
  end
end
