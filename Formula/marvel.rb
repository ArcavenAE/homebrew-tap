class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.202855.10398da"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202855-10398da/marvel-darwin-arm64"
    sha256 "9586c2cedab3ffa91f34c0da9f2893f4ce8e8ab7f5d409a6e22d35d54c087b80"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202855-10398da/marvel-darwin-amd64"
    sha256 "a00f40c5fa767f0dbdb8e7f38cbf076c61c393a220ee662c2cecdfc6de2bba47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202855-10398da/marvel-linux-arm64"
    sha256 "ee0ee11dde6ca8e48185eb2cea5867304362292ad7ca4432d8d5ecc5e406a1e8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-202855-10398da/marvel-linux-amd64"
    sha256 "8601592b43aa57de528d8eef4e4b730f5493f6aad9fe2d6ac654720d037cc3a9"
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
