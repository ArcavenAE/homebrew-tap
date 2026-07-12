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
  version "alpha-20260712-223439-4c276d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/sbctl-a-darwin-arm64"
    sha256 "736876b8055839392952dd03f9ce12c2dd77bfb618eb6fb379464874fa6e100a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/sbctl-a-darwin-amd64"
    sha256 "e78c99e5af12b0a96800552d9e90f44a248827aee38744fbc7a98bfaae31fd67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/sbctl-a-linux-arm64"
    sha256 "98e6533cb6bd85d89e2a9a981f72b1f8c4d3a1a4a57d3ba518b803fc20c049e8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/sbctl-a-linux-amd64"
    sha256 "8be839fc3c0a3f79cb6e01979cb18f2fad704c153d44aed632bc6dd3de6da122"
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
