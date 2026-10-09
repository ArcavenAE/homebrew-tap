class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.072049.d9ef67a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-072049-d9ef67a/marvel-darwin-arm64"
    sha256 "2540f6dd423d8ca2b55f73759af6fdc0eef19dfe63fc4f0901f8a90da6820d3e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-072049-d9ef67a/marvel-darwin-amd64"
    sha256 "8125c9e0d9874720393e7eadc71e9ca409ac1c2254194fbef15355c3cda9e407"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-072049-d9ef67a/marvel-linux-arm64"
    sha256 "88f0950fb9cd06f9862d8819d8bf07f96158a83d9445f92da798f4126385e345"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-072049-d9ef67a/marvel-linux-amd64"
    sha256 "dcaf5e1edde5f8067509973bec13772bd240b2dd253d0b1126222f0983b9af76"
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
