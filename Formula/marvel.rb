class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.070404.68da3f5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070404-68da3f5/marvel-darwin-arm64"
    sha256 "cb7224563e4e8181eb10fa85c48016490d5467e537ab2ca61c7294f9233a19f5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070404-68da3f5/marvel-darwin-amd64"
    sha256 "b20105c56783d8d682b6be13379d7e639e2e9e00fae2aeb51797ed01a2df6e92"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070404-68da3f5/marvel-linux-arm64"
    sha256 "2b2258ddddc5120bc18a0e1193f1a64d429e12a9677454d2ce2e8fd9a1359b3c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070404-68da3f5/marvel-linux-amd64"
    sha256 "8437d5ffe4c5e16384106e0178e6809ac77e377cb4b63288adde1548d3ee54dc"
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
