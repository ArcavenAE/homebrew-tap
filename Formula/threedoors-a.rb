class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260402.225445.73fa537"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-225445-73fa537/threedoors-a-darwin-arm64"
    sha256 "789ed43d739ccc013cedb52840f3352f436873c537044757367a791752f14e76"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-225445-73fa537/threedoors-a-darwin-amd64"
    sha256 "e7fa54d5817ddbb13e2f27da21402a3123a2a4e378bbac5a48b1d9bf349e092b"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-225445-73fa537/threedoors-a-linux-amd64"
    sha256 "1d2ebd4495e6e869928390b544d7fc5ebcfece172d0354c56956fbdb5d5829f4"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
