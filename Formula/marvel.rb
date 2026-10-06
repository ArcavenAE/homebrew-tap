class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.212859.409593c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212859-409593c/marvel-darwin-arm64"
    sha256 "343973e9af3f8274d652b97f54b8d646476f8c5b77676f498ec89b81ac019683"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212859-409593c/marvel-darwin-amd64"
    sha256 "9d7e15bbd7769a98d0fe7892c61c6451bbb4b2c72a19051db52b2ee15b5b87d9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212859-409593c/marvel-linux-arm64"
    sha256 "e0edce984d7e078e7b49ff5f3f4814bc1a75c10778325b0b2593044f00f1deae"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212859-409593c/marvel-linux-amd64"
    sha256 "bc357a3a1aa2b0364ae7d3972de5f3f61702d63dae60e4c4599f2323a38e22cd"
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
