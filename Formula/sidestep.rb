# Homebrew formula for sidestep
# Single channel, kos pattern: updated by CI on every push to main
# (alpha-... versions) and on v* tags (stable versions). The same
# formula tracks the latest published artifact, alpha or stable.
# macOS only (arm64). Linux support is a future option.

class Sidestep < Formula
  desc "Rust CLI for the StepSecurity API — codegen from OpenAPI, audit-trail-as-feature"
  homepage "https://github.com/ArcavenAE/sidestep"
  version "alpha-20260501-205235-888c5e2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/sidestep/releases/download/alpha-20260501-205235-888c5e2/sidestep-darwin-arm64"
    sha256 "e98da46dff725bcf3431c0846395596a015270486ce0f9b1f9a6fb3da5e88088"
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
