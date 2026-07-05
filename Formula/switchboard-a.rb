# Homebrew formula for switchboard-a (alpha channel, legion clone)
# Updated automatically by CI on every push to develop.
# Publishes from ArcavenAE/switchboard-blue — the legion / spike clone of
# canonical ArcavenAE/switchboard. macOS (arm64, amd64) and Linux
# (amd64, arm64) supported.

class SwitchboardA < Formula
  desc "Low-latency encrypted tmux session router (alpha channel, legion clone)"
  homepage "https://github.com/ArcavenAE/switchboard-blue"
  version "alpha-20260705-214648-b75a2f2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260705-214648-b75a2f2/switchboard-a-darwin-arm64"
    sha256 "6e006f1717ab612af222a20421201f270031564bd4962f33467f286333956560"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260705-214648-b75a2f2/switchboard-a-darwin-amd64"
    sha256 "df0edf6d5829ed036fda2e75525993c2c7935e8ca6ba6f69991d918dc98c8c3f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260705-214648-b75a2f2/switchboard-a-linux-arm64"
    sha256 "8de3d1acbc2ba033bead0fd6053ab5ff5baf334da65507b4926fb9e5f422d185"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/switchboard-blue/releases/download/alpha-20260705-214648-b75a2f2/switchboard-a-linux-amd64"
    sha256 "2de4d714de5a28afb9ef356b816a3604ce2091603f83a2838dcc1da7b91942ce"
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
