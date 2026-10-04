class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.173417.bd44fa6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-173417-bd44fa6/marvel-darwin-arm64"
    sha256 "515083f3c89a57ddb20672b67baf0dfb57015546db14315a79658eae418e2cf2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-173417-bd44fa6/marvel-darwin-amd64"
    sha256 "182d305aca0df93e6680b2c5ee2da97d706b599c770e1e0b5688185e041f7799"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-173417-bd44fa6/marvel-linux-arm64"
    sha256 "0c338fbd33ecfa56a05f00f3c9dc1cc2cc1d65b980dd4e8f032bf80a14d39fdd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-173417-bd44fa6/marvel-linux-amd64"
    sha256 "b1e2dffa24a370fe854b09cd5328dc8a81add45d2f6531f6186f247822813187"
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
