class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.055402.e1dcaa5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-055402-e1dcaa5/marvel-darwin-arm64"
    sha256 "b7e98acdc206bfdee5de8f19153e65880dd73719b4bb153cddd26135955256df"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-055402-e1dcaa5/marvel-darwin-amd64"
    sha256 "451ac8b3a98c0fbc148924ecf56f8b6fdcf47d5b1075b5628800f90cbaabca44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-055402-e1dcaa5/marvel-linux-arm64"
    sha256 "6eee1b5d435d35ce436d577d780a9318d4ac025c21b7994273ebb1edd249eca4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-055402-e1dcaa5/marvel-linux-amd64"
    sha256 "be0e0e639643461cf4d2e7888d90ff58a3eded4d847647e2a7cb56b15f2d9231"
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
