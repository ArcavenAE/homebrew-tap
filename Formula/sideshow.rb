class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.223234.345a579"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-223234-345a579/sideshow-darwin-arm64"
    sha256 "4612148bc22f94164708496dc02f4058842de6a0ad89eb915559e31da51d8503"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-223234-345a579/sideshow-darwin-amd64"
    sha256 "1041732449b001974ec9d09bdb61a9032fc5afe8846a786b01605fb94693f4a1"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-223234-345a579/sideshow-linux-amd64"
    sha256 "17f444d519b2c4fec4b0c38432150b7f788a8e222ef34629f716d8aa6b1ac641"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
