class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.071824.89ffa00"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-071824-89ffa00/sideshow-darwin-arm64"
    sha256 "39471332747ff065b5ba4693014961bf49e772de134d2da17fc8c8c60511f278"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-071824-89ffa00/sideshow-darwin-amd64"
    sha256 "d11d216bddb58f9f85b546f13c685f27d3bb6817bd6e839ca8791be46b5b4bfa"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-071824-89ffa00/sideshow-linux-amd64"
    sha256 "7b44753d9ebe3f49d5edf736597913da14937a22048dedfc8e2a2a2cfdbc73c9"
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
