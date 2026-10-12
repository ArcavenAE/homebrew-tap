class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261012.022719.8029b3c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261012-022719-8029b3c/marvel-darwin-arm64"
    sha256 "9af17f70e0ee8a4646a5b3fd846dab99ea7b04eff2aa615c170056f1ae20fe20"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261012-022719-8029b3c/marvel-darwin-amd64"
    sha256 "93a6325b998969572d8b892d3716365c1682cc2020a0d261020f2503f9498a56"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261012-022719-8029b3c/marvel-linux-arm64"
    sha256 "c51ca8c212c6ca15e3618c5976c93d6e675f85c794762a667875977f14d5d879"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261012-022719-8029b3c/marvel-linux-amd64"
    sha256 "e180760e83e58a5db6ad2bd2d40178438d47452fe99d812233b713ff4a41805b"
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
