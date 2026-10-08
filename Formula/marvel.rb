class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.023624.e28095b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023624-e28095b/marvel-darwin-arm64"
    sha256 "22cf7a718c56c36e45a316fb654c5a59fe587db55964200cf7a20c373eaee7ae"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023624-e28095b/marvel-darwin-amd64"
    sha256 "707455f31056959829370018b213eebc1e187e4378b1c1a1e0344ef382567cd9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023624-e28095b/marvel-linux-arm64"
    sha256 "2eb084fdea2d31170e54034f8444ab9b3b19aae26fdfb192dd8aa0031ab1fc5c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023624-e28095b/marvel-linux-amd64"
    sha256 "0906ce19c7720c5d00a4d3780045e7e7e01a6e61cf04ea6d85a1d3ed832ba2e6"
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
