class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.002358.c32ff3f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-002358-c32ff3f/sideshow-darwin-arm64"
    sha256 "6729cb0f837b5553dc2b7b9d99fc6a6a33c0d2c0f5c852a0e331ba4646aa6162"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-002358-c32ff3f/sideshow-darwin-amd64"
    sha256 "8753b8938950c8348c9fd60c0603cb272a3a3d48aad4d2dfe82fcce2d0d0fc9e"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-002358-c32ff3f/sideshow-linux-amd64"
    sha256 "c0eb112396163192e68e34ca62a465707af3aa10fb5bab5383e952fa02628deb"
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
