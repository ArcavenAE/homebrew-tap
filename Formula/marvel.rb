class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.231240.2f4e306"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231240-2f4e306/marvel-darwin-arm64"
    sha256 "ad2c8581dde040c9ccee612774f0bf1ceea9de19bb837c877703c1c42efd2aec"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231240-2f4e306/marvel-darwin-amd64"
    sha256 "6075f788972dc9229f77c1214afd378f4dcb2afaf71d51792d3a954407551f5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231240-2f4e306/marvel-linux-arm64"
    sha256 "2be2f4a5ee85509062bf98b53e71a7b56955cd34a67ddffada08c107a88c8d59"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231240-2f4e306/marvel-linux-amd64"
    sha256 "2a0eed21c321e0131a01d2e0b1f2c810a4c43a343a4fcb63654205b15ce006a3"
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
