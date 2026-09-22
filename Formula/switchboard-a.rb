# Homebrew formula for switchboard-a (alpha channel, legion clone)
# Updated automatically by CI on every push to develop.
# Publishes from ArcavenAE/switchboard-blue — the legion / spike clone of
# canonical ArcavenAE/switchboard. macOS (arm64, amd64) and Linux
# (amd64, arm64) supported.

class SwitchboardA < Formula
  desc "Low-latency encrypted tmux session router (alpha channel, legion clone)"
  homepage "https://github.com/ArcavenAE/switchboard-blue"
  version "alpha-20260922-192024-d2513b0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/switchboard-a-darwin-arm64"
    sha256 "a32f4267a47537d5c207f9441c3b25c57217a8dc65a72ee0bb76aebfe0564304"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/switchboard-a-darwin-amd64"
    sha256 "8facddaccf3e43610425e9c4c2a80f18e4638564a722944d2ba420bb7a2c319a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/switchboard-a-linux-arm64"
    sha256 "c9732907433237d3ccf497a08f4204401ebcbc9273ea70068a9a11702c27cbbf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260922-192024-d2513b0/switchboard-a-linux-amd64"
    sha256 "ab198a37b4c81540411036edcf0938d1480a5efb6b590188c2cea62cf8d4ed5a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "switchboard-a-darwin-arm64" => "switchboard-a"
    elsif OS.mac?
      bin.install "switchboard-a-darwin-amd64" => "switchboard-a"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "switchboard-a-linux-arm64" => "switchboard-a"
    elsif OS.linux?
      bin.install "switchboard-a-linux-amd64" => "switchboard-a"
    end
  end

  def caveats
    <<~EOS
      switchboard-a is the alpha channel for switchboard-blue, the legion
      clone / spike variant of the canonical switchboard project. Updates
      on every push to develop.

      This formula installs the binary as `switchboard-a` so it does not
      collide with the canonical `switchboard` formula on the same tap.

      For the canonical stable channel (once published):
        brew install arcavenae/tap/switchboard

      Requires tmux at runtime.
    EOS
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard-a --version 2>&1")
  end
end
