class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.004357.0b00ace"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-004357-0b00ace/marvel-darwin-arm64"
    sha256 "27cd3239920ecc42c11eed6830a488bc64f139d02b54ba9a0a508d0f65d94bd5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-004357-0b00ace/marvel-darwin-amd64"
    sha256 "bc28777b75302f105aa0a07a786da308d36d3b5884ddacfba0e46dd798c0d9fa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-004357-0b00ace/marvel-linux-arm64"
    sha256 "a40a6df2c06958f45082ecfb120400cb07e2fa0b07162668052f041a595969be"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-004357-0b00ace/marvel-linux-amd64"
    sha256 "db0c35870b9df272b2984773323466d6749b61a7bfc3ac71a7d883f5d3c30cb0"
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
