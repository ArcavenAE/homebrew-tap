class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.231626.c3de0bd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-231626-c3de0bd/threedoors-a-darwin-arm64"
    sha256 "fbf6c2f6ce83c2e3c17a91a82d41b8dc1bec9025d93911b3e99b6db142777505"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-231626-c3de0bd/threedoors-a-darwin-amd64"
    sha256 "bc39de022d396abb0efb4ae8dea77811c355beba60e7dd50c41ae4650e8892a0"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-231626-c3de0bd/threedoors-a-linux-amd64"
    sha256 "93234b428bcb206b3e5d8af50a03c30f6825cde1541b8bb59ce1636158743349"
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
