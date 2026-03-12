class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.142001.6978e36"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-142001-6978e36/threedoors-a-darwin-arm64"
    sha256 "43674d9dfca5fb17aed61f1f1c16b2a5aa11df84ec7aa3fc4f68ec8b65c75c0d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-142001-6978e36/threedoors-a-darwin-amd64"
    sha256 "55619a972a55382e563103dd7cfbabad46a7172ad1f1cd134ecaccd9390276c8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-142001-6978e36/threedoors-a-linux-amd64"
    sha256 "066752ead401ccd6bc40739cbddb05c5eac8983dffb29ce8e5bc957a79a78cf6"
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
