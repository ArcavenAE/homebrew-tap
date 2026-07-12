class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260712.172617.7e3abe1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-172617-7e3abe1/sideshow-darwin-arm64"
    sha256 "664f0326629fedabe4c2bfdb881b7a28c6269bd31259c23e8754b2273955885b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-172617-7e3abe1/sideshow-darwin-amd64"
    sha256 "4e23494a21219b932c355d44dbfd7a626328e41a417095b3fb89bb90a9c20fc7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-172617-7e3abe1/sideshow-linux-amd64"
    sha256 "b84652f9f38370e64aab8d6e75b8889ef9e44cb1e31276865bce80a987ca0bcf"
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
