# Homebrew formula for sidestep
# Single channel, kos pattern: updated by CI on every push to main
# (alpha-... versions) and on v* tags (stable versions). The same
# formula tracks the latest published artifact, alpha or stable.
# macOS only (arm64). Linux support is a future option.

class Sidestep < Formula
  # Homebrew desc audit: <= 80 chars (incl. any channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Rust CLI for the StepSecurity API — OpenAPI codegen, audit trail built in"
  homepage "https://github.com/ArcavenAE/sidestep"
  version "alpha-20260716-002148-2eb3cc4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/sidestep/releases/download/alpha-20260716-002148-2eb3cc4/sidestep-darwin-arm64"
    sha256 "3e438647144309437cde4a8d637fbb450daea82f1b2213f9aa3305c5e357b3ff"
  else
    odie "sidestep currently only supports macOS arm64. Build from source for other platforms."
  end

  def install
    bin.install "sidestep-darwin-arm64" => "sidestep"
  end

  def caveats
    <<~EOS
      sidestep updates on every push to main (alpha versions) until the
      first stable tag is cut.

      Bootstrap a token (recommended — uses macOS Keychain):

        sidestep auth login --token <bearer-token>
        sidestep auth status

      Discover and invoke operations:

        sidestep ops list
        sidestep api <operationId> --param key=value

      Every API call writes a structured JSONL audit line under
      ~/.sidestep/audit/ (macOS) or ~/.local/state/sidestep/audit/ (Linux).
    EOS
  end

  test do
    assert_match "sidestep", shell_output("#{bin}/sidestep --version 2>&1")
  end
end
