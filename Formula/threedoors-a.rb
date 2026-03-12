class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.143100.256a12a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-143100-256a12a/threedoors-a-darwin-arm64"
    sha256 "31b218224aa130997a159449ba254b547e41bdb39e6c6e9acc30eb337dbec49d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-143100-256a12a/threedoors-a-darwin-amd64"
    sha256 "1d3a5eb6c276d2cce27d3e86de4788759a0b65116f456393de793b944f8f5c0a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-143100-256a12a/threedoors-a-linux-amd64"
    sha256 "c133962493fc934ae1e439f790b41e1fc03287a47f539faa3307602261b21682"
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
