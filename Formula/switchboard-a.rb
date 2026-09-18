# Homebrew formula for switchboard-a (alpha channel, legion clone)
# Updated automatically by CI on every push to develop.
# Publishes from ArcavenAE/switchboard-blue — the legion / spike clone of
# canonical ArcavenAE/switchboard. macOS (arm64, amd64) and Linux
# (amd64, arm64) supported.

class SwitchboardA < Formula
  desc "Low-latency encrypted tmux session router (alpha channel, legion clone)"
  homepage "https://github.com/ArcavenAE/switchboard-blue"
  version "alpha-20260918-185957-0cebac2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/switchboard-a-darwin-arm64"
    sha256 "69a4ce1d809e74dd1b21365f8eaf89aa240d7aa2ebe08849793d3dce95c2e2a1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/switchboard-a-darwin-amd64"
    sha256 "6b7d7f93c5c73029728b3daef36a062517fd5f2f36d4a45a6556e180b1ad0a2b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/switchboard-a-linux-arm64"
    sha256 "f89dcc1eddd227a451ac269945b4d8070d83ad515d8e72ebeab50cef4015c425"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260918-185957-0cebac2/switchboard-a-linux-amd64"
    sha256 "3b34ffa42350172895463d6d218d3aaa470c2740ae8ad1044047dd2a581b7b76"
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
