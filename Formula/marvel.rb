class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260802.002554.fe8f874"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002554-fe8f874/marvel-darwin-arm64"
    sha256 "56fc4c781aa4631c4df3e2d91a0874651a84ecb29c61748b1bb03fe7c0ac61e9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002554-fe8f874/marvel-darwin-amd64"
    sha256 "be45459a24b30aef6cc699772943746c84715f98cf4424d91e30443d63ac1e17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002554-fe8f874/marvel-linux-arm64"
    sha256 "c995ca55e8f9147c4106126441d19ddbd4123f21208551c8270778e68ddc9828"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-002554-fe8f874/marvel-linux-amd64"
    sha256 "f240968f6f376e0dda10f39ebe535afe81e93b628e7d5b7f16c865ef8f7b4d22"
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
