class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.151656.4f11f81"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-151656-4f11f81/marvel-darwin-arm64"
    sha256 "dc834d53cf65712d68a61b9ba8892085b16f6dcfa0c4190568f61b087067c4c6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-151656-4f11f81/marvel-darwin-amd64"
    sha256 "b373f145571247cf3e3bd69dfe0e4401cc4bd059d5480dc9ea8468d1002514ed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-151656-4f11f81/marvel-linux-arm64"
    sha256 "cdcf0d4b0f736de6d38d572f04fe25c0da2e7a020296394fbb62c55d807d1ccb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-151656-4f11f81/marvel-linux-amd64"
    sha256 "8fa03ee15afae3e1c349c7e17b0ee2e137c17f6f8e60e0509e1cf7ff97626af7"
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
