class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.031325.f9a4340"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031325-f9a4340/marvel-darwin-arm64"
    sha256 "492180609ba477b1cf098bbabdd8b1f01043aa46f4d4c740c61b33f987ece209"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031325-f9a4340/marvel-darwin-amd64"
    sha256 "0f0775a82a46d19794e5dda65627eb40c0847826a93fbd6dfddb769dfc9f657a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031325-f9a4340/marvel-linux-arm64"
    sha256 "da20c61deab347c65311c1f204e55171c724d5a32cea9979dbfa3e7e44202e75"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-031325-f9a4340/marvel-linux-amd64"
    sha256 "74b86cb2274b2abbbd66c5760bbfd285622776746440bfe87ec3ba05260d63d6"
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
