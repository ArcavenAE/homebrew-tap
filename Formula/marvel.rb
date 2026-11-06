class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.033237.70cc805"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-033237-70cc805/marvel-darwin-arm64"
    sha256 "dce4145484e2a4924a0b5d977efa3a0faf7cdd5fa813c1f123ee4be7f4ad3264"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-033237-70cc805/marvel-darwin-amd64"
    sha256 "02d3f04e623f2bba3f9799644c3cd62cbaa845c697fc708abc7030fbad205400"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-033237-70cc805/marvel-linux-arm64"
    sha256 "d9290011eb602d7d2b989e65906285b56025e5460b1753f6eb2cebf8e366c1ab"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-033237-70cc805/marvel-linux-amd64"
    sha256 "d586693bbec98b08f2f3d98efefa994fbe2c2196c06b78feeedbe53459a38a3b"
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
