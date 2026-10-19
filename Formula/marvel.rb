class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.085212.f1fe67f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085212-f1fe67f/marvel-darwin-arm64"
    sha256 "b2d0a788f8841111c3d20cf35c941830babd93097d2d591b4a2a77034e668ff0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085212-f1fe67f/marvel-darwin-amd64"
    sha256 "9e55e5ff753c9de2645381e3296ff83a05f5a352e645f100f89a28e56aa17494"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085212-f1fe67f/marvel-linux-arm64"
    sha256 "60bcb3e0ab01629a9f983d00c41a36dafa50cd6e11b333af7357a42b21e504e2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-085212-f1fe67f/marvel-linux-amd64"
    sha256 "5df49bb6d7914309f176ae6ce64a5f042ef5070afd2512088928ec33ee683a2e"
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
