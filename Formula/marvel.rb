class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.174229.a19ec4b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-174229-a19ec4b/marvel-darwin-arm64"
    sha256 "127875a4b57d3661314c55f42a5719de8f719153902e5bd5369e7b288097589c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-174229-a19ec4b/marvel-darwin-amd64"
    sha256 "9376ee42141cea4bd9bfb58702583351716c8125fe134a828055c1f772bfb320"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-174229-a19ec4b/marvel-linux-arm64"
    sha256 "0f6e7412bcb0e3f2d64aa4b6cbe421f4f989a95147f6eb88b1da3e995c2d358f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-174229-a19ec4b/marvel-linux-amd64"
    sha256 "26ce6127d8d55bf704c1fd1ad22d384ccdf83ecdd07e41e97e9d2449316c38ff"
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
