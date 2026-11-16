class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.072937.3146207"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-072937-3146207/marvel-darwin-arm64"
    sha256 "781254557f3dd69355e15e29b77e7c9cbd9b255f0c7392a1eea85e9c9a1ae1f4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-072937-3146207/marvel-darwin-amd64"
    sha256 "9c486562a325bc0d9ac08b07b13272aa62a83b74848257926133ec3a91a086a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-072937-3146207/marvel-linux-arm64"
    sha256 "b1e43cf9752165fb0149bdf9eccd0d9291c68274550fb780d0627a0eb2565320"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-072937-3146207/marvel-linux-amd64"
    sha256 "48e2b42ecda827cd72f6788ae6b8a9f9d3aba4c056b6a70acec943f033530e2d"
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
