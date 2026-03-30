class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.070613.fc61c5e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-070613-fc61c5e/threedoors-a-darwin-arm64"
    sha256 "f42a82ea98b097efd460212cb3cddef85f8fa083f4dafffe67088eee039fcb70"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-070613-fc61c5e/threedoors-a-darwin-amd64"
    sha256 "7778a8b9a317550494b85cd5630facd9e2658504350bf734c6106d3df4ba3bfa"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-070613-fc61c5e/threedoors-a-linux-amd64"
    sha256 "5e7de3b8a0387da8f93c37e366dc77c321e6c5ea54bb5832d8da65413372f017"
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
