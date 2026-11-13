class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261113.174217.92fe7ab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-174217-92fe7ab/marvel-darwin-arm64"
    sha256 "5f6e18489fc3b986ae2b897f2a301571eccd441f37af46fb7efea9cac344142d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-174217-92fe7ab/marvel-darwin-amd64"
    sha256 "4889a92f22e118669ba095f87e7156a6ab33bc6c87bcdf5f2f33f281b1a4d8c2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-174217-92fe7ab/marvel-linux-arm64"
    sha256 "8243e96859767ad8024e7d291fdddbb6b646c7b35ce6c2500e6a13f15ece1926"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-174217-92fe7ab/marvel-linux-amd64"
    sha256 "fb5de0aee1d9b69d0c9d5462ad23d3e4b14b6abdd77253bdb7011ef2e3e81fca"
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
