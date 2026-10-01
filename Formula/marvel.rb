class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261001.014015.9ee3421"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-014015-9ee3421/marvel-darwin-arm64"
    sha256 "691bf8193c11de065fae6320f42b7c0ad445ff9b901ff445a5de583d4e080ac7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-014015-9ee3421/marvel-darwin-amd64"
    sha256 "e00dc59741c68bfc2d4854cb47a24074462bd8dad83243e7dee0359f0347bcca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-014015-9ee3421/marvel-linux-arm64"
    sha256 "69a349b81fe01226cf2e73e0104706c63f12eedfb3cf6d330c03155ff3dd699e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-014015-9ee3421/marvel-linux-amd64"
    sha256 "8170c548ef0df5896932cc54fe41fafd204be799f8bac4deada42b412ed65b00"
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
