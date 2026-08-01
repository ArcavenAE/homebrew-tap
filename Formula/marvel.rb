class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.035544.226c3d5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-035544-226c3d5/marvel-darwin-arm64"
    sha256 "180a3f8afe961054d2462f7db4552f053e8108758a426f8295652224033ed0f6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-035544-226c3d5/marvel-darwin-amd64"
    sha256 "f8549822ff889892938518f1af5f2c199d27dfd994e4de0a1505d89db1d01a87"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-035544-226c3d5/marvel-linux-arm64"
    sha256 "4d922824cd9e325fc71167040d89d9bee489122c4144eda517e95bfb0b4840b0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-035544-226c3d5/marvel-linux-amd64"
    sha256 "dd183311182d2144c78aae3a327070d4c7e68834ba6c5cff8d183cad1b9f22ce"
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
