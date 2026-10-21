class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.205829.71e7703"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-205829-71e7703/marvel-darwin-arm64"
    sha256 "327d3f01ca4fd3fc6eea022c39fea4438ff2c8937932431a0831697712741678"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-205829-71e7703/marvel-darwin-amd64"
    sha256 "b6a99d28d098d19c8583e9cde49ded36cd38619fd83c960bcb45fe757aa82a44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-205829-71e7703/marvel-linux-arm64"
    sha256 "82390ee2d31c9afb5d718941f32ef2c0b81b907d96944ec68b533b79ee892829"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-205829-71e7703/marvel-linux-amd64"
    sha256 "2870d5796eabfb97f317d95115d4fc46590b313ac21486dbb65cf7ca6ef9a585"
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
