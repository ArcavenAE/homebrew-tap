class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.060942.de2bf93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-060942-de2bf93/marvel-darwin-arm64"
    sha256 "580950c1436c1e28ab2a6cceb3914e4175ee9c0283f4a471aa32050ab5c68e51"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-060942-de2bf93/marvel-darwin-amd64"
    sha256 "aa1ecde16f6806690e24e5574c06a5f347dd6e8ebbcca96e69b9b7e16059e37d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-060942-de2bf93/marvel-linux-arm64"
    sha256 "229d368d62d5ab4676ac033f3a30686c26576d66b8aae7fd3b739394cc687a08"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-060942-de2bf93/marvel-linux-amd64"
    sha256 "62241b2edb531dd5aa1522b02f878596c5b6ef344cabcf214b1075f30fba4242"
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
