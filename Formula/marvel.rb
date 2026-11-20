class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.134052.cd94742"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-134052-cd94742/marvel-darwin-arm64"
    sha256 "a3c3927f1c4fec7ddc9ec5e2b3496c1b641266e519e5006b17556e554e0ef68e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-134052-cd94742/marvel-darwin-amd64"
    sha256 "6a0614b5cee6b7e5f2102f0bd8b37fa40e5d19369ce41f9509bcfa60008734a3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-134052-cd94742/marvel-linux-arm64"
    sha256 "ef240b94d88930fea604f3e1a2bed4e56c3b67e99b41ca2ce5c0ce4b56303950"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-134052-cd94742/marvel-linux-amd64"
    sha256 "8385c53160e2657d7f34e30b6c62ac3764650f119885b06cda12d208cf4cfd05"
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
