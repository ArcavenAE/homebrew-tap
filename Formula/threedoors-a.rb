class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.004932.8628393"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-004932-8628393/threedoors-a-darwin-arm64"
    sha256 "3d34f3b628df420eac02434e2d5b2722fe3c26c2d42eba90a81941332fec3f40"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-004932-8628393/threedoors-a-darwin-amd64"
    sha256 "120e51d316ce826322d0823faf39a3cd18cd57d509fbf5f3cee813d6c285f8c1"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-004932-8628393/threedoors-a-linux-amd64"
    sha256 "65a0dffa332b5727f5ca7c7b51b66ab00990451dd58f82e8f8657385eb299e26"
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
