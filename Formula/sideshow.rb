class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.175609.c85e7e6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-175609-c85e7e6/sideshow-darwin-arm64"
    sha256 "a55cc401b30c625ba9becd5c5a8065c38c970ddfda804f6f5fe25ebe23067be1"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-175609-c85e7e6/sideshow-darwin-amd64"
    sha256 "0d2d8a329bb41e94989c7921426cb4b37a04f1e336303188140c79edc597f389"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-175609-c85e7e6/sideshow-linux-amd64"
    sha256 "2190631fa12da0bdccaaf0199f01acb3952ca5e0e5af917d5874fa072888e0e1"
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
