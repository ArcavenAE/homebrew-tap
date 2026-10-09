class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.030605.7a4764a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-030605-7a4764a/marvel-darwin-arm64"
    sha256 "915ad28400257572c0cc11bb9df4508ed28ac9c4f9592d86d8c206bd415466cd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-030605-7a4764a/marvel-darwin-amd64"
    sha256 "b9032d640bc098a3afefa9926201c333bc50ba16579a5827092c53c4824d189d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-030605-7a4764a/marvel-linux-arm64"
    sha256 "582cd875ed1d15ac98552f9c733bd4a788e29797d6a25804cbcb2c0b434d65f6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-030605-7a4764a/marvel-linux-amd64"
    sha256 "8fa7e6c6ad7cd2da044f1e27199a1d9eee3d947d85e47bdcb07ab541249604f8"
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
