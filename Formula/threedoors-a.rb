class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.26a4c4e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-26a4c4e/threedoors-a-darwin-arm64"
    sha256 "eca8cf6917b70b7de81a89cd78a78cc33334ac8c85fed1e86a15f88a2ef74a56"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-26a4c4e/threedoors-a-darwin-amd64"
    sha256 "128af632ebcd40c7dfe1eb76525d5cfd22ecf31bf130ff9f48aad128807eb2b1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-26a4c4e/threedoors-a-linux-amd64"
    sha256 "3a86c35f8bcfe7809439e5ab78d898b586e192abdd430236ec8a0fc3e80b03d9"
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
