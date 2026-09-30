class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.055641.4ee42bb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-055641-4ee42bb/marvel-darwin-arm64"
    sha256 "47b3e0d3734f540c36747c897cebf23e21f5ca30d53ac9e2d3d84290a6b536b1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-055641-4ee42bb/marvel-darwin-amd64"
    sha256 "e59dc64c3d1f0f0902c3e31b16f4d11a35d90deeb37fb417c01d63f20bfbc5bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-055641-4ee42bb/marvel-linux-arm64"
    sha256 "8ee7e9ce78d546d3830c78a3a6e655dff490eec8b0e16d720a8a1a1499849364"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-055641-4ee42bb/marvel-linux-amd64"
    sha256 "0c6c049dd6d14ca6fc95a23aaf92906aca7304bb402f755eee66e49f5d456a56"
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
