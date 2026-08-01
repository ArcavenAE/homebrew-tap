class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.021205.7188eac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-021205-7188eac/marvel-darwin-arm64"
    sha256 "c7680a8fe3f2bd2d40d78dcdd8a3b699ed4e2e60750964ebc8f04d313e2db968"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-021205-7188eac/marvel-darwin-amd64"
    sha256 "97cf75134cfe1fec317873839450bd52e489b96b1dcd8fd588e5a7b3cc6c9d9e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-021205-7188eac/marvel-linux-arm64"
    sha256 "dec4bfed4ec780d103b98f207d1a1e83ffee5ca0642c757d0d27dc7853e0ff7a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-021205-7188eac/marvel-linux-amd64"
    sha256 "38ed076812947ac192ad2a0fadf1097af9390a0eaae3f0e15076d39c7fd7f4a9"
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
