class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.372c6f8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-372c6f8/threedoors-a-darwin-arm64"
    sha256 "977214e8081471151d084b642ecdfb6afab395c2d2df0d35d8c6ef14a58445b7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-372c6f8/threedoors-a-darwin-amd64"
    sha256 "4b1601ca6b926c06769c3e92ea356e6ecc603b3e7545a21ef026424e92525ad5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-372c6f8/threedoors-a-linux-amd64"
    sha256 "92fa55902a15a4dc54a1e8e2035cd203508e2ff8c4b48d153cf36ecb05e603b3"
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
