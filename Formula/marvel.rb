class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261024.201651.3ad31cd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201651-3ad31cd/marvel-darwin-arm64"
    sha256 "18e76b13fbae3efba500efb5ad9faaf399ce2ccc2ac8034f9304c8fc6d60f433"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201651-3ad31cd/marvel-darwin-amd64"
    sha256 "bb1e68d17aa203a9b9b3abf0e11129ceb842e7745c18eb02a88ca2a5b6266b86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201651-3ad31cd/marvel-linux-arm64"
    sha256 "843429b503cc12b4c6b28e7e6934e5789e5acb03ad40245e1907a54df00e930d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201651-3ad31cd/marvel-linux-amd64"
    sha256 "e5cf099f17f7880a2bb598f37c44d50ecc520469f740f006d41427f073ab6ae4"
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
