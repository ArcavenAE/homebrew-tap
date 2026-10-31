class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.030937.be20772"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-030937-be20772/marvel-darwin-arm64"
    sha256 "a849b97d3b674effca4d56ada2f478abd917916d6a1b258be50e514c76aa96d8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-030937-be20772/marvel-darwin-amd64"
    sha256 "3695a276a7e66140cc890817c89b4ebc3a2937640cdce93770fb60eb5027ea42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-030937-be20772/marvel-linux-arm64"
    sha256 "54f53f5d67088ecd97c09ca60627fdd1f9052af7d39e809d230c70cff74a420b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-030937-be20772/marvel-linux-amd64"
    sha256 "68b18023745a418ef338d6d3e0b02b5189c7291f10d91bebce9e5c2284578527"
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
