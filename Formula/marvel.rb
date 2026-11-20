class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.154902.810cdc6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-154902-810cdc6/marvel-darwin-arm64"
    sha256 "84f7c0afdc4cb6ac5b642a1a9e5f7647c5cb29fdba1a4fec7812e7694510c59e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-154902-810cdc6/marvel-darwin-amd64"
    sha256 "b284938031e440e4938959bd1385f9d4942e68690d5c6395e730a5fa0025c0ff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-154902-810cdc6/marvel-linux-arm64"
    sha256 "f4aa1746965dc2e37fb0bff58126fb6d8f9eaeff94a25cee74af494b8782fa2c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-154902-810cdc6/marvel-linux-amd64"
    sha256 "6df880903cfb3304a6493da2a8ec057f96fc697fba2e13db2e214b3f51c1b4a3"
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
