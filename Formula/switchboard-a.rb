# Homebrew formula for switchboard-a (alpha channel, legion clone)
# Updated automatically by CI on every push to develop.
# Publishes from ArcavenAE/switchboard-blue — the legion / spike clone of
# canonical ArcavenAE/switchboard. macOS (arm64, amd64) and Linux
# (amd64, arm64) supported.

class SwitchboardA < Formula
  desc "Low-latency encrypted tmux session router (alpha channel, legion clone)"
  homepage "https://github.com/ArcavenAE/switchboard-blue"
  version "alpha-20260712-223439-4c276d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/switchboard-a-darwin-arm64"
    sha256 "8c8e973933ceac2d91fcf918f12b3c2e195a2eba3259788f3801af8527cd895c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/switchboard-a-darwin-amd64"
    sha256 "c858c1e31ecb1c82b1738c38d151fc3c69d677f27c2a0902683eb5d7e726f1fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/switchboard-a-linux-arm64"
    sha256 "6413f9517bc2e08084b0ee3892711a41d6b43d2092e8893d7b1034931620366e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260712-223439-4c276d9/switchboard-a-linux-amd64"
    sha256 "220710382ffb27436fee4f07fa18c66401762a49123de4a13d39266ab3fd6ab1"
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
