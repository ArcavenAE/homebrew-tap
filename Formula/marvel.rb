class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.152615.76517f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-152615-76517f7/marvel-darwin-arm64"
    sha256 "ea188284289cf079a1781d2de6c1b3df16b2e5d98d910591782fac4a078500b3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-152615-76517f7/marvel-darwin-amd64"
    sha256 "e19c2bab29762b526354818ea09303cfb3b351882b38c3d092b5e5ef0bae350a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-152615-76517f7/marvel-linux-arm64"
    sha256 "5a3e5269b528d389581ffb0fd3604a615b8c4db93c30b719cad9d077baaf13ed"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-152615-76517f7/marvel-linux-amd64"
    sha256 "849d1f96d84e81294b65f343d51c8fcde40ccc8a76f11f514b1374d4209f71f7"
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
