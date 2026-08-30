class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.062721.a9ee600"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-062721-a9ee600/marvel-darwin-arm64"
    sha256 "5f174fdbdfdd3c7580086188b0cc04cb900335a054d57bb5392dcb8c02da1fff"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-062721-a9ee600/marvel-darwin-amd64"
    sha256 "5e22bd6bbcd34ab5b9c34d96a63941faf7fec069419419b3a54da5884bd38a8f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-062721-a9ee600/marvel-linux-arm64"
    sha256 "8a5063c56f00c88906a043a9ffad03a49b640bc90f21e3d0cd816804c4c3fd1e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-062721-a9ee600/marvel-linux-amd64"
    sha256 "c217f8798fe97a1c0a0b0fc749a5adc8459a6e170976a91e33d324580369f374"
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
