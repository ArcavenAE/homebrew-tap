class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261021.011007.ff64c14"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011007-ff64c14/sideshow-darwin-arm64"
    sha256 "2a6b8862016b5466758f93afd766ce00db3d84481cc18de8d078138a860a434f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011007-ff64c14/sideshow-darwin-amd64"
    sha256 "7d417dd62588794637f7dba96a863b7ddd0e7c8125f95101222d712296cf5049"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011007-ff64c14/sideshow-linux-amd64"
    sha256 "c0eefa769a642304914de2e1e303326d63a9e8aae92e16f959281985fcc9e4a4"
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
