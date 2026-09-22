# Homebrew formula for sbctl-a (alpha channel, legion clone)
# Updated automatically by CI on every push to develop.
# Publishes from ArcavenAE/switchboard-blue — the legion / spike clone of
# canonical ArcavenAE/switchboard. macOS (arm64, amd64) and Linux
# (amd64, arm64) supported.
#
# sbctl is the operator CLI for switchboard daemons — see docs/sbctl.md.
# This formula publishes the alpha-channel build as `sbctl-a` so it does
# not collide with the canonical `sbctl` formula on the same tap.

class SbctlA < Formula
  desc "Operator CLI for switchboard (alpha channel, legion clone)"
  homepage "https://github.com/ArcavenAE/switchboard-blue"
  version "alpha-20260922-192024-d2513b0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/sbctl-a-darwin-arm64"
    sha256 "17a5635e17ad6660e93acd11d6ef4b9979cf4557727b071540c589de9df1693d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/sbctl-a-darwin-amd64"
    sha256 "4adeedfebb30203ca01cd0ba5d0a1afa69bf48af305ab95fd6f0f5b916abbb8c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/sbctl-a-linux-arm64"
    sha256 "dd06ccb77c62b2ab07bb6a4e77e90018614639e86040daea64ef5205d5a0643d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/sbctl-a-linux-amd64"
    sha256 "6a36b40e9778ccf7431b85b0ac57809b12cca7d13a2087b40a5d6ba55dcdef7e"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sbctl-a-darwin-arm64" => "sbctl-a"
    elsif OS.mac?
      bin.install "sbctl-a-darwin-amd64" => "sbctl-a"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "sbctl-a-linux-arm64" => "sbctl-a"
    elsif OS.linux?
      bin.install "sbctl-a-linux-amd64" => "sbctl-a"
    end
  end

  def caveats
    <<~EOS
      sbctl-a is the alpha channel for the switchboard operator CLI, built
      from the legion / spike clone (switchboard-blue). Updates on every
      push to develop.

      This formula installs the binary as `sbctl-a` so it does not collide
      with the canonical `sbctl` formula on the same tap.

      Typical install pairs sbctl-a with the daemon:
        brew install arcavenae/tap/switchboard-a
        brew install arcavenae/tap/sbctl-a

      For the canonical stable channel (once published):
        brew install arcavenae/tap/sbctl
    EOS
  end

  test do
    assert_match "sbctl", shell_output("#{bin}/sbctl-a --version 2>&1")
  end
end
