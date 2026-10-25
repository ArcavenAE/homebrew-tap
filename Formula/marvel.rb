class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.181754.13e385e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-181754-13e385e/marvel-darwin-arm64"
    sha256 "624d6e9b854742d89822a650ad9dccfeb749e397b75d3617185ba3104a7cbe2c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-181754-13e385e/marvel-darwin-amd64"
    sha256 "d83bb6031dd157d64cf3e98bc6431c616db2403dc5b5f8e84e434a04e988395c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-181754-13e385e/marvel-linux-arm64"
    sha256 "3d609cab8904b3cdc6e741d1cc875d99368277f6a324d1f522273feab550e8b1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-181754-13e385e/marvel-linux-amd64"
    sha256 "f15256e8fe90680a1befa02fa029c5827da51c2fa7e5d5ca84040735fa1a2d58"
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
