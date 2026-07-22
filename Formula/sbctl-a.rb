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
  version "alpha-20260722-023746-86e420d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260722-023746-86e420d/sbctl-a-darwin-arm64"
    sha256 "277bb3e03a32d0ba5d9c83d6d25ae72b925b6b8acc439a634e5b96f5429f22f9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260722-023746-86e420d/sbctl-a-darwin-amd64"
    sha256 "ed53dada224b814a94302dbe974d2ad8054295a416427423c92e1370d876acf1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260722-023746-86e420d/sbctl-a-linux-arm64"
    sha256 "17847f1a864b87c678a43e8e7ab6d78b39b5b1fdeaf57b41759da5145b348bd1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260722-023746-86e420d/sbctl-a-linux-amd64"
    sha256 "ea3da2aa84e0cd7404589173641b70581c3cfa2a8ae93af8091716293951aaee"
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
