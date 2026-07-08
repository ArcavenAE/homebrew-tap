# Homebrew formula for switchboard-a (alpha channel, legion clone)
# Updated automatically by CI on every push to develop.
# Publishes from ArcavenAE/switchboard-blue — the legion / spike clone of
# canonical ArcavenAE/switchboard. macOS (arm64, amd64) and Linux
# (amd64, arm64) supported.

class SwitchboardA < Formula
  desc "Low-latency encrypted tmux session router (alpha channel, legion clone)"
  homepage "https://github.com/ArcavenAE/switchboard-blue"
  version "alpha-20260708-215230-8eb54a5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/switchboard-a-darwin-arm64"
    sha256 "099113bd373da2521b8daa8cc22361f43b78c5a7660b8f37ee4fb5bc238803f8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/switchboard-a-darwin-amd64"
    sha256 "a00d3ce8633b37a068b9b8924da46c9b81eb7682463a5fb694fd9036c9d921ee"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/switchboard-a-linux-arm64"
    sha256 "b0af2abd1c9b976a9a7abc21e5d435009c5e1aff45f0f67e24fd697167ecc402"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260708-215230-8eb54a5/switchboard-a-linux-amd64"
    sha256 "67ce9ddbec2eeb39a1fe085d372c49556676f9d359e0f6822f7d86dd21d66231"
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
