class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.205946.503e725"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-205946-503e725/sideshow-darwin-arm64"
    sha256 "0ec605c7740cecde04dc39fa68e0ed2bc097868a06ca9206b333bbe4f2bf12f5"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-205946-503e725/sideshow-darwin-amd64"
    sha256 "ea5f21e2067fc7457c6e6e2d27513197c5ce4e78dc587d66f2f1c2871073af29"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-205946-503e725/sideshow-linux-amd64"
    sha256 "18a8b1da6c5d76de1992aa56eb34e2b7b70e4809ad116c9c7fd7612abec5631c"
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
