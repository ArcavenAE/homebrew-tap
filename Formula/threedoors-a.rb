class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.231543.c38c1f1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-231543-c38c1f1/threedoors-a-darwin-arm64"
    sha256 "ea4405a1cd7bf097b9c115218391a71946427ed5649d1a6e852bc4c0056fd9ae"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-231543-c38c1f1/threedoors-a-darwin-amd64"
    sha256 "92fd0692a3ec5fbdec0e959f46c962511451f58ad4cd688444fb4b9dc608cc70"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-231543-c38c1f1/threedoors-a-linux-amd64"
    sha256 "ea8ae2034b48d9e966cc4c2991b5d86bc85e9ad7e1f144e30df9636d3ded29a5"
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
