class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.113227.ad2457b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-113227-ad2457b/sideshow-darwin-arm64"
    sha256 "a2621f824ed5e6c8b7643456e75b194c8409f38675a340d45ab86d4f930436eb"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-113227-ad2457b/sideshow-darwin-amd64"
    sha256 "55e4b2e62b20e4c27a94a635772bed231a7df43134f2adf8b3d5829b2996ad18"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-113227-ad2457b/sideshow-linux-amd64"
    sha256 "7e23954ef74ad194a0f69d36f85457e43b541dc557b62fec71f303dae12be030"
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
