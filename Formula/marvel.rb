class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261103.080614.867b1bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-080614-867b1bf/marvel-darwin-arm64"
    sha256 "2f7aeb093fd1abecdf3286797f99cbf8f30aa8128f7b024e5c5c81a1214aa9ef"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-080614-867b1bf/marvel-darwin-amd64"
    sha256 "485fe4276fe625a2035b6a9b119d839bac8d6a6988ef5da607eecf533bc8279e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-080614-867b1bf/marvel-linux-arm64"
    sha256 "d2875df17de0d3b1afe05addf62bdba568532fd133e923701fd68ea16981dfb6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-080614-867b1bf/marvel-linux-amd64"
    sha256 "37fa6b0c0b119ff767cbd8c3dc03f800d0ac89b763c6feb0afe65786c6c006d5"
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
