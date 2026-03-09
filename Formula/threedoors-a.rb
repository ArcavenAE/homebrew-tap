class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d760d45"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d760d45/threedoors-a-darwin-arm64"
    sha256 "e899a8fd79354087e6d7671f32f29b205cb038677fbaa04eb07f8c7bc8a2ffc2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d760d45/threedoors-a-darwin-amd64"
    sha256 "09283f3d1e524325f9e5c50a8276e6e10b898d00fc4b063df7164864ce995719"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d760d45/threedoors-a-linux-amd64"
    sha256 "08877f3d5319b5b43f3b910d5f195e6b49447abdd734f146767675192554e819"
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
