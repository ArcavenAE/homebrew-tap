class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.213046.ec17f5a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213046-ec17f5a/marvel-darwin-arm64"
    sha256 "3448b50b1e9ee047d3d85f0dd541bf6e28681149584dc1d78ed54784d2ee2f35"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213046-ec17f5a/marvel-darwin-amd64"
    sha256 "8d4446462c436712dc8fc06434edebb5ac4da177824de2e3fdb67061a385bb92"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213046-ec17f5a/marvel-linux-arm64"
    sha256 "cf3a71832270914602136fdc4178c6963730fe2d689de0b4a8deaaf5f896570f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-213046-ec17f5a/marvel-linux-amd64"
    sha256 "157909110323cb68ee915f7c5cc9597caefb3aaf21b1871eacd5d9e1460fbb3f"
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
