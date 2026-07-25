# Homebrew formula template for the sidestep RELEASE-CANDIDATE channel.
# Updated by .github/workflows/rc.yml on every merge to main, which cuts
# an automatic v<version>-rc.N tag. Installs as `sidestep-rc` so alpha,
# rc, and stable coexist. macOS only (arm64).

class SidestepRc < Formula
  # Homebrew desc audit: <= 80 chars (incl. the channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Rust CLI for the StepSecurity API with local audit trail (release candidate)"
  homepage "https://github.com/ArcavenAE/sidestep"
  version "0.1.0-rc.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/sidestep/releases/download/v0.1.0-rc.1/sidestep-darwin-arm64"
    sha256 "618cbfe117c3602f5fa3a27e7de78faa9e8829aee770609fd9e24e951fb54e8e"
  else
    odie "sidestep currently only supports macOS arm64. Build from source for other platforms."
  end

  def install
    bin.install "sidestep-darwin-arm64" => "sidestep-rc"
  end

  def caveats
    <<~EOS
      Release-candidate channel: cut automatically as v<version>-rc.N on
      every merge to main. Installs as `sidestep-rc` and coexists with
      `sidestep-a` and `sidestep`.

      Bootstrap a token (recommended — uses macOS Keychain):

        sidestep-rc auth login --token <bearer-token>
        sidestep-rc auth status
    EOS
  end

  test do
    assert_match "sidestep", shell_output("#{bin}/sidestep-rc --version 2>&1")
  end
end
