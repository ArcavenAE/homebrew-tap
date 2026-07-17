class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260717.165847.c408773"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260717-165847-c408773/sideshow-darwin-arm64"
    sha256 "95da54dc1b2b8860f796239bc2978d4e37a2835af9d73bf643b6bb18e73066f8"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260717-165847-c408773/sideshow-darwin-amd64"
    sha256 "013469aeb94bf4b38a5b3af4418cbbfb73d67406e16bbcbbc7e66b29c57fe9e1"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260717-165847-c408773/sideshow-linux-amd64"
    sha256 "b7f54206e29b3db7da26a4e5c9af351312b6e8109d98b88be8561ebc0facf9e5"
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
