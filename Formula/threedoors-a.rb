class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.2e833b0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2e833b0/threedoors-a-darwin-arm64"
    sha256 "4db362e20155f3f98250c3baae324e2db89e66e7eb1f9bed10fc7f0209e91a85"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2e833b0/threedoors-a-darwin-amd64"
    sha256 "4eeb4c63d72c8774a2682c03bef02724ed3d271809ba73b3d1e657ac3cd2c760"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2e833b0/threedoors-a-linux-amd64"
    sha256 "da397013d5630956ea759cd28e7f82879d423d0df6ea86a0895ddc7ac15b66e0"
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
