class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.003452.998a318"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-003452-998a318/marvel-darwin-arm64"
    sha256 "8f0dc2457bfd41a08770d994cf60426f01b343e6839117d683d6632e12750902"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-003452-998a318/marvel-darwin-amd64"
    sha256 "c43f094ce62fa95015601a0759018e371cb72683a1a1047a8a15663f30dd1caf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-003452-998a318/marvel-linux-arm64"
    sha256 "b2c7afdb4450705dbbc09466279e2dd1a4771b3565b2a3d43e2d3f81d2a2eeaa"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-003452-998a318/marvel-linux-amd64"
    sha256 "47098e00d7c4b1d03e5e6d691dc5940258f49f81993210a0011864db8e8006d0"
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
