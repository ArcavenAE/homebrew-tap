class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.180332.de39d0e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180332-de39d0e/marvel-darwin-arm64"
    sha256 "f5effed2c8fadb46c85cc9d30dea501124cca09e2e84ea4fb065a7a541260155"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180332-de39d0e/marvel-darwin-amd64"
    sha256 "74745b86fe61057bd563ae81cef1933e29e200c50d3cd83ae101c68b1759c17d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180332-de39d0e/marvel-linux-arm64"
    sha256 "5138a19a418bc2febc519dd37992f653dd449c056c4f9b78e0f15d849c1fe897"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180332-de39d0e/marvel-linux-amd64"
    sha256 "78748bdbfe095749867de0655506c7d2d9c201f98d2b328615703df88f60f702"
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
