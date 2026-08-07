class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.070645.358d882"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-070645-358d882/marvel-darwin-arm64"
    sha256 "2f1bac03ee2083e57f131e079cd7b5723bca9570570504c007098891350eecf9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-070645-358d882/marvel-darwin-amd64"
    sha256 "27c73cfdbfda49d32af3c26e67ffbd731d647a756169d5b52954cc7b7da79338"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-070645-358d882/marvel-linux-arm64"
    sha256 "af7c37fcdfb8849f0fe7ca49ab27e529de634865dbae003171dafc56b8328d81"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-070645-358d882/marvel-linux-amd64"
    sha256 "660d95873758db151425e8a1e303b63ac35725dec2c5cec22cdc580586df2e1a"
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
