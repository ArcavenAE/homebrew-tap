class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.031238.5203158"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031238-5203158/marvel-darwin-arm64"
    sha256 "2f36344fdec13ba951bf34a91890253e06ad1d778f7db942e1fa0c44a0cc20ee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031238-5203158/marvel-darwin-amd64"
    sha256 "0addab3aa0e43391212e4d51d8a50eb501d1a3c2f92a597ff2db1e1472ece969"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031238-5203158/marvel-linux-arm64"
    sha256 "fc8c4df563e6d8c09644bf28ae9452ea5a4c4506f2d2e14c73bd5cd50550a886"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031238-5203158/marvel-linux-amd64"
    sha256 "7aa999a64fc1feb0fb6eb82d56df39bbf1458b3a0872ae93d247e85db9e631bd"
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
