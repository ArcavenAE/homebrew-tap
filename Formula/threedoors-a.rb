class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.352292b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-352292b/threedoors-a-darwin-arm64"
    sha256 "463942411448850a798d3cd45fe947ee7e6faaa3f43407c7f5d520da8a2ba7cd"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-352292b/threedoors-a-darwin-amd64"
    sha256 "4a563255e99d709d48017945f2d83bf5a66a387e65ad77340defd17afc1557a3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-352292b/threedoors-a-linux-amd64"
    sha256 "0a8b8bac21e881f7a5a5a8813bb5b512f13cbe03eedf7ed5d28dc1a30b22b1a3"
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
