class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.043945.d028e7d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-043945-d028e7d/sideshow-darwin-arm64"
    sha256 "80ddc8ed25163c0a56c870d227296b16ab1993f7f1539d2fd0ba1bbc3662d6e8"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-043945-d028e7d/sideshow-darwin-amd64"
    sha256 "40175f6229deb935c4f41db3daa3279e33f360791c7acbed431df3c012b89b8d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-043945-d028e7d/sideshow-linux-amd64"
    sha256 "e22c9ac7c2e39e1faa41a87a416cd842f0ee5d5c103a6cf97dc2808308f47023"
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
