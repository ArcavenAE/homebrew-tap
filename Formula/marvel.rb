class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.000008.0d11beb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000008-0d11beb/marvel-darwin-arm64"
    sha256 "f007740b53f8d8b198fe25280fe601d7df03e0137869548d817c26e9e03a89bc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000008-0d11beb/marvel-darwin-amd64"
    sha256 "d98f0c2a1c4a00eada96f68d000b4df81897128dd9a00ed8eaa3409c9837d990"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000008-0d11beb/marvel-linux-arm64"
    sha256 "f909ff83fae43d4dbd75f0ef042f22d2ea4d3bab54adc64f0cc2343bf21851da"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-000008-0d11beb/marvel-linux-amd64"
    sha256 "14eddcf0f588ae7a7cd69755a0b0c87de62f123648785cc55cefc24c3e92ed11"
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
