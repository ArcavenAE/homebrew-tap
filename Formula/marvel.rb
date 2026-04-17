class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.204023.664f6e0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204023-664f6e0/marvel-darwin-arm64"
    sha256 "9490409b81346139a64affccaae0ecd37adcf85f0cc647f4a7d9d5c47f8d24c3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204023-664f6e0/marvel-darwin-amd64"
    sha256 "c0605d3b359b6ab2376ef794bce969de7e66e68b070a841db9109a7f742c8f6a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204023-664f6e0/marvel-linux-arm64"
    sha256 "10113aab18dd1eac975f9acd2a0bc59d41321826ad8c40a6910ebd6fbe53ddb1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204023-664f6e0/marvel-linux-amd64"
    sha256 "58512264c11f3a024d3f4a10344d1a9440f0e681c04d154b7b10604e4d68de80"
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
