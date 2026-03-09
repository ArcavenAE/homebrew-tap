class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.4ed3eb2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4ed3eb2/threedoors-a-darwin-arm64"
    sha256 "2260f000897615607ba4e488f2cd10e9678ad1e1343c11ff33a4fc6b56b2894f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4ed3eb2/threedoors-a-darwin-amd64"
    sha256 "13f0f439848413f857d717d96259f92167f7d74a68ce9c0f485fd0503c56d0aa"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4ed3eb2/threedoors-a-linux-amd64"
    sha256 "690c3e76985f6b9c4e10f297880f97b3d1f8f3b5d90dbc4ae08413f66c8352a5"
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
