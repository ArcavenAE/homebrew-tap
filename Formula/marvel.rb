class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.042457.b291485"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-042457-b291485/marvel-darwin-arm64"
    sha256 "2698460bc5f69ebcbcf302bc95c3433461f4525d4c19d221053ca906f0e44b94"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-042457-b291485/marvel-darwin-amd64"
    sha256 "a8ca35e63a20e99036631309f633e863660b8e2219483c89dec8d50e12c2da30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-042457-b291485/marvel-linux-arm64"
    sha256 "36d3e03914bc9d1d5b472f991167a6e847eed2a429d78431bed0ac8c299541a1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-042457-b291485/marvel-linux-amd64"
    sha256 "58bf8c5d047b51c22b981486e0c3a07a9c88f086ed6a0ffc87d9bf1a0bb74239"
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
