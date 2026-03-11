class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.e3b1f35"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e3b1f35/threedoors-a-darwin-arm64"
    sha256 "89d0ba50340c0715cd733ccff2cee8fc3da92c0cc59fedb5226e6d57c21702ed"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e3b1f35/threedoors-a-darwin-amd64"
    sha256 "35aa4fcbec1785d2ca8bd85a68cd1112652796a953321a972a3d4ebd4407f21a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e3b1f35/threedoors-a-linux-amd64"
    sha256 "90a534f96404929ff614d38c284094d89dda0465433a9702e4b5d10677e05124"
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
