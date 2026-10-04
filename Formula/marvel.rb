class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.230604.3b7fe00"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230604-3b7fe00/marvel-darwin-arm64"
    sha256 "88750f52796e4c97473d13c17e619d59445b1db9da10bbb086f3218de809aec2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230604-3b7fe00/marvel-darwin-amd64"
    sha256 "7d21e6802809819cf636d15246a152bfd25ed529351922ad41f30d62330cb7d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230604-3b7fe00/marvel-linux-arm64"
    sha256 "a9e424079b344de1bfb14e871598129297570d708203f2d1e125ebb005c05e77"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230604-3b7fe00/marvel-linux-amd64"
    sha256 "af7ece8d92a139925673aa924caae4e5938a97c6669de321c75b359c7f278250"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
