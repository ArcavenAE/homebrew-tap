class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.185328.cec1fab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-185328-cec1fab/threedoors-a-darwin-arm64"
    sha256 "66c2783d5d99fe7b88c5ea4c9e39bbe4195624d5d78825fb7b30592a1d6eef58"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-185328-cec1fab/threedoors-a-darwin-amd64"
    sha256 "9839d04cf8da5959a8ebd5ccf1a2c48d96f4fc0db046d140f0faeecfa9fb92c9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-185328-cec1fab/threedoors-a-linux-amd64"
    sha256 "0bfe976aab0775c5a47a1873c56e1bfd1c070234fb8ca2b373efbd811ee618bb"
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
