class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260816.201336.84ec78c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-201336-84ec78c/marvel-darwin-arm64"
    sha256 "c4eb977cbf1cf1dfc9ff3e607c32205b913869db8f571fdd7b2319b8405fae85"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-201336-84ec78c/marvel-darwin-amd64"
    sha256 "0bd0ac5cbd2e99b2a21b81ff662bc28543164807427cb467ba4f8d729873f9bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-201336-84ec78c/marvel-linux-arm64"
    sha256 "5a7ae7f12fa3bfa2ff7e9cd37fd158aa6ad1f7c271a9fad19e95c52b4500b835"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260816-201336-84ec78c/marvel-linux-amd64"
    sha256 "290ea4cdd2a5060924dd4ffc17ae24814acd7a7623ef064bfcf41e9a7c29f4f9"
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
