# Homebrew formula template for the sidestep ALPHA channel.
# Updated by .github/workflows/alpha.yml on every push to develop.
# Installs as `sidestep-a` so alpha, rc, and stable coexist
# (forestage-a / jr-a fleet convention). macOS only (arm64).

class SidestepA < Formula
  # Homebrew desc audit: <= 80 chars (incl. the channel suffix), capitalized,
  # no leading article, must not start with the formula name, no trailing period.
  desc "Rust CLI for the StepSecurity API with local audit trail (alpha)"
  homepage "https://github.com/ArcavenAE/sidestep"
  version "alpha-20260823-204912-491b13a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/sidestep/releases/download/alpha-20260823-204912-491b13a/sidestep-darwin-arm64"
    sha256 "2c96cbfa6dfff52901bca724ece7a8e0bab286cf50e258147b1352e4bfbaf63d"
  else
    odie "sidestep currently only supports macOS arm64. Build from source for other platforms."
  end

  def install
    bin.install "sidestep-darwin-arm64" => "sidestep-a"
  end

  def caveats
    <<~EOS
      Alpha channel: cut from every push to develop. Installs as
      `sidestep-a` and coexists with `sidestep-rc` and `sidestep`.

      Bootstrap a token (recommended — uses macOS Keychain):

        sidestep-a auth login --token <bearer-token>
        sidestep-a auth status
    EOS
  end

  test do
    assert_match "sidestep", shell_output("#{bin}/sidestep-a --version 2>&1")
  end
end
