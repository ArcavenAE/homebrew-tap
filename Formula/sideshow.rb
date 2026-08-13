class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260813.092721.2a40d1d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260813-092721-2a40d1d/sideshow-darwin-arm64"
    sha256 "4b5472439ee806c0aff61a0739e3daf7df5175ad4eaeae4fdca01fddce7eade3"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260813-092721-2a40d1d/sideshow-darwin-amd64"
    sha256 "76448c6188c33cf8b61ad383e7f8a558958715ce7df9dc81ad7ee724e9028c4a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260813-092721-2a40d1d/sideshow-linux-amd64"
    sha256 "75084f1cb36f0410b6a10b1bfa4c6690872c88434428793b37f9d72abac6ade4"
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
