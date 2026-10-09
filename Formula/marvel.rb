class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.200923.2329fa1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200923-2329fa1/marvel-darwin-arm64"
    sha256 "1b087c6fc460fee0e6380d0ba54668fea1aadddf0263e8fc8b56d3dc8d7df301"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200923-2329fa1/marvel-darwin-amd64"
    sha256 "5ecbccab538f53659d3f8371802138c44ecd6a0b0b2eb4df88afafc1e7bdba65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200923-2329fa1/marvel-linux-arm64"
    sha256 "8f3138aa60ba39eacb321cfe265e2b1d4ca068226f923c0acf2cf09f46da3bf1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-200923-2329fa1/marvel-linux-amd64"
    sha256 "00d0e67b2057db670581c7e8d9f0554ee17bb4f0a21083e36931f402f5677ca8"
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
