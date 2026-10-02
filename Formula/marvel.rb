class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.215431.ecf8301"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-215431-ecf8301/marvel-darwin-arm64"
    sha256 "c81ffc85740238a61ace024c3cbb2ce0e82b5b0a00d5719e363e7c578e247f32"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-215431-ecf8301/marvel-darwin-amd64"
    sha256 "82093087e18510d34e0aa35ee9a61882b9f83dcb32711ba22c8776ef2016465a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-215431-ecf8301/marvel-linux-arm64"
    sha256 "eb31aa7fdd27648ad87d9b58442f31574e39bd45915969dc52ad0e8a7e8bd639"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-215431-ecf8301/marvel-linux-amd64"
    sha256 "2d086ab610f76e88b10659eb18a0588f7f8ad5e46650b49065cc8df0df694519"
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
