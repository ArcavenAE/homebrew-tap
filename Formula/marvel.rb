class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.044824.ad9d527"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-044824-ad9d527/marvel-darwin-arm64"
    sha256 "f141813534a0c0e00378d822dfe631add61dabd768aa1c6cae0a858862919ea8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-044824-ad9d527/marvel-darwin-amd64"
    sha256 "290bc6c4698fb3be81b31b82d0e29b5c03d19d8e140769e1653ff340f62cfac0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-044824-ad9d527/marvel-linux-arm64"
    sha256 "61c45f773dc496a270070cf32c307d27e22999800611d06b0094dbee3086d6a0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-044824-ad9d527/marvel-linux-amd64"
    sha256 "a573eaf46ffb5422aa1e1736cb5c5c969f7376056b9f2e2e035608ded77fafff"
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
