class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261111.004204.7e091b1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-004204-7e091b1/marvel-darwin-arm64"
    sha256 "7893c93b62b61cce5d8d630256ca2645bba33e329b1d7eaa2375535b41767964"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-004204-7e091b1/marvel-darwin-amd64"
    sha256 "ad92e18ae162146ef13cfa64bb5e8ad23a6f074b40bfea678913e75dcd9a4c2d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-004204-7e091b1/marvel-linux-arm64"
    sha256 "dccdaaff40358ce1b3534734c649f2af96992d3445130d6bbc82ce459febfead"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-004204-7e091b1/marvel-linux-amd64"
    sha256 "73cccca88fcd5f8bd6c4837dbfa3921230487b91ae729267b367d7e13616d360"
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
