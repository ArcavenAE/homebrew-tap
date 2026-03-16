class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.065142.24c48ca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-065142-24c48ca/threedoors-a-darwin-arm64"
    sha256 "f2a1352d961ff5b95db700a248e6f716749c639c24277d142852f5afdd132b78"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-065142-24c48ca/threedoors-a-darwin-amd64"
    sha256 "e192fec28ebe5b5cb6aa14f91b5793707887ac4a54a89f68d3e2863c3f7c9261"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-065142-24c48ca/threedoors-a-linux-amd64"
    sha256 "bbafb9eca6788bb061f4a36267294417036498cef01d9eb3d8b5c2311ba0b8b4"
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
