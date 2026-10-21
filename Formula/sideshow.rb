class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261021.011042.d36d6d1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011042-d36d6d1/sideshow-darwin-arm64"
    sha256 "714313e64c99c1d474a350ba28fbf93d72291bdce5c7a20664df650da904595b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011042-d36d6d1/sideshow-darwin-amd64"
    sha256 "65541e79fa6dd4202d05b69924702ff38b69084fe91a9376497ebe68c2ce5e7f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011042-d36d6d1/sideshow-linux-amd64"
    sha256 "e3ce5810ae932d515e08839cbf5ce9e87da5ee922bbcd7ed93f8d7a6fb871e4f"
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
