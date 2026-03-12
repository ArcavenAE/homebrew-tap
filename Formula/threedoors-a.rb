class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.195535.e97cfb0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195535-e97cfb0/threedoors-a-darwin-arm64"
    sha256 "8b7aa227a57e741a3ccbf87be697ee8ec362725a24cb381e1a618b5b0d73b78f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195535-e97cfb0/threedoors-a-darwin-amd64"
    sha256 "425966058987f82f22fe27c9ac76a0358360498d0839543c32c35796ea667838"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195535-e97cfb0/threedoors-a-linux-amd64"
    sha256 "ccd019ace112088030c4838b9d199979b472582c1bf3d677d97389d39ecb433d"
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
