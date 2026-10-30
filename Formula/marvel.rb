class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.134331.f5ca34f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-134331-f5ca34f/marvel-darwin-arm64"
    sha256 "f0202193679e0dbbaa631585d15f789b1857df291fd63350f6d1d0ed56d5a229"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-134331-f5ca34f/marvel-darwin-amd64"
    sha256 "9a3c499b854fb5cf4309a4a473164a2aa281e2878e9579fb7c62b81a338526d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-134331-f5ca34f/marvel-linux-arm64"
    sha256 "6cfed147602a6fdaeb13175fd8e6e7307fe6845d8ea9e97743a91a7fb040053a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-134331-f5ca34f/marvel-linux-amd64"
    sha256 "f20d48e8956962414bb262524c805e4535a49b2976dd2d0457a1feb6c94abede"
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
