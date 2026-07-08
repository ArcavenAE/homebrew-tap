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
  version "alpha-20260708-215230-8eb54a5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/sbctl-a-darwin-arm64"
    sha256 "29d8c54cd6f708adffc0de22256769f184d073138ba8ef7a92a93a7af456b7df"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/sbctl-a-darwin-amd64"
    sha256 "14a6cbf07c8430b072d64f279e298ffc8c2eb542006b2b371ef4af86905cb4f3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/sbctl-a-linux-arm64"
    sha256 "4e4eb61593bd38f0624664df5d6f1437e49018f96d6f5033f5a1591c88b0dea1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/sbctl-a-linux-amd64"
    sha256 "32154feac7635833f83f209f14a83c0f1dd257721ff041bad83427425276a574"
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
