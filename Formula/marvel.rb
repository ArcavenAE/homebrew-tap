class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.231759.fc36354"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231759-fc36354/marvel-darwin-arm64"
    sha256 "2f8c4678d461ece93612265337c13495626b510603b3b2eb9eb67f85c178f0de"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231759-fc36354/marvel-darwin-amd64"
    sha256 "00837a55e3ee21957e81bc3f96f497e68ae957b904bf86bfcf5d3356271a2c35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231759-fc36354/marvel-linux-arm64"
    sha256 "7144150ff46ffac54280eac82f4cf8bc71b96b776990560a61e1f86efd9e51f4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231759-fc36354/marvel-linux-amd64"
    sha256 "9973882b368195918828e1844421ba6ff658feb28a49c7e2ec1f5b5e35ce7e88"
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
