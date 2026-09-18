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
  version "alpha-20260918-185957-0cebac2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/sbctl-a-darwin-arm64"
    sha256 "b390a740c4e57a8ce9025715c25924ecb4d76a3a8daf70bd5f3a56677b426fb3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/sbctl-a-darwin-amd64"
    sha256 "a4fe5e693a4228e88342d960db3ca53bff064999e4f5f11d07c2fa11360a03c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/sbctl-a-linux-arm64"
    sha256 "532bdd94950d01e26c43587c8341a1b6c3a768abf54e1746cde98c493f938686"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/sbctl-a-linux-amd64"
    sha256 "6c6a66b4be62fb947809cf27264c21ca104ae14b36a7415bebec75cb3cc07c26"
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
