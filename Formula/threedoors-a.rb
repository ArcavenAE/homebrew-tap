class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.034607.9609ad6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034607-9609ad6/threedoors-a-darwin-arm64"
    sha256 "cf8fca5b993af3db6a9e632e13632a08d6aaf4edfe7f85c3e5fb74477f153579"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034607-9609ad6/threedoors-a-darwin-amd64"
    sha256 "98d3d65a57d50708a18cc7f4a005a663c3541606885adb6290ed1dca33ab7995"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034607-9609ad6/threedoors-a-linux-amd64"
    sha256 "768002ccf3c4a1a8797242da04f7803007126c8efca3467616139e07113b9df1"
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
