class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.000657.c802e80"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-000657-c802e80/sideshow-darwin-arm64"
    sha256 "8b9ed78afb0dc11ba3fe550549aa66a8bef81babcc8347cdd31d4a06687b95d3"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-000657-c802e80/sideshow-darwin-amd64"
    sha256 "24ff9e59ece3fdf08159d9e77e7f3a1a32ea941e9faed2236389b66ad9a6807a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-000657-c802e80/sideshow-linux-amd64"
    sha256 "c912fc9cf2f0ff7ac7e0019c520a165b4e11c18f75bb3d0a8e42823a3db0fe7a"
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
