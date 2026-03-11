class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.37d144b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-37d144b/threedoors-a-darwin-arm64"
    sha256 "a8b149a9aaa6ec42f0ec9d667e7f75539cda02f776de37d6a17b4ef9ce67f128"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-37d144b/threedoors-a-darwin-amd64"
    sha256 "51be389ed185ac7ebf926ad03b92fb3cd8df54eaf30bcff7bbc8cbdf37cb727b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-37d144b/threedoors-a-linux-amd64"
    sha256 "10e48c1c1a9286bc0bf5deb18539ae5e8d788bc470570417dfc6590bd96cd9b0"
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
