class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.230900.6d7dff9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-230900-6d7dff9/sideshow-darwin-arm64"
    sha256 "316a5afad5a8f158965dd506bf6b2cb931edf7d78b717433fb3e60dfdba3588d"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-230900-6d7dff9/sideshow-darwin-amd64"
    sha256 "ab5d69b3c7ba9beb4f5672ba7a1060dcf3f2ada58f94fcc78f5a6ef0951e0da2"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-230900-6d7dff9/sideshow-linux-amd64"
    sha256 "dc947291f09306268c360a73fb4ffdfae2393d224a250aae98545b58c4456e41"
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
