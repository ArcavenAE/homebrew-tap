class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.744ca77"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-744ca77/threedoors-a-darwin-arm64"
    sha256 "72cb0077ad00fd260dd351d5443b6330e6c9e922b0572f547116cf2d3056927f"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-744ca77/threedoors-a-darwin-amd64"
    sha256 "fec77c6e3d5421fb35080c062ae46e83ae7015b7b66cdf28d9ac3975a26b547f"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-744ca77/threedoors-a-linux-amd64"
    sha256 "90f5dd35e1840e95973de6f3785533fcbe80bd53912f18b57d731516bb640bb7"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
