class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.055100.7f62729"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-055100-7f62729/marvel-darwin-arm64"
    sha256 "19ff39ab86d5a707bdb34b9af066f4fb01bbf8db7c3549d4bd69d65b38146a85"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-055100-7f62729/marvel-darwin-amd64"
    sha256 "8abd4e2bff6bd7d4df904f92e4ea3ed0f38a174790e3d3c884193d0702240b8c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-055100-7f62729/marvel-linux-arm64"
    sha256 "7cfee1c8563a6f2a3389bcc970054e5d42c866b6a1908ccf252ef271ba2056f9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-055100-7f62729/marvel-linux-amd64"
    sha256 "afcda8943e99097c93c2b8c2bfaa655f11518ff8171833eed3b865a10ead9e09"
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
