class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.064336.399cef8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-064336-399cef8/threedoors-a-darwin-arm64"
    sha256 "7b727a51fa97cfb89978547752e1d9f9c6ec4a05018fc3cb58a51c88e3fa9b0e"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-064336-399cef8/threedoors-a-darwin-amd64"
    sha256 "a8290787075cf5f2f58e57eb247e6d312716bba698cf7695d88bb5a672a3a507"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-064336-399cef8/threedoors-a-linux-amd64"
    sha256 "0c7b830ac7d0502f5b02529c0d2da0305c77d81b2256eb6b774d257936d15c97"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
