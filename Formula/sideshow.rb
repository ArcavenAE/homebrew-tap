class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260706.015505.5fe94f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260706-015505-5fe94f7/sideshow-darwin-arm64"
    sha256 "45597f6045a61f54ae635502a3a99229b8a80746e38ad0090f6b2615eb43232b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260706-015505-5fe94f7/sideshow-darwin-amd64"
    sha256 "b40810c3cf031bdfff011211ef6d6d140b07f98835303022bc9bf68d1889e18e"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260706-015505-5fe94f7/sideshow-linux-amd64"
    sha256 "1f179168f8d3abe57b139cac32d67a173344be5b8482c242e3d4fef9375850ef"
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
