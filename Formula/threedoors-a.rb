class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.69d4376"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-69d4376/threedoors-a-darwin-arm64"
    sha256 "d83df63027b629e75178616631dce1affc897d73c57a08eb7fea8e99284dbcc4"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-69d4376/threedoors-a-darwin-amd64"
    sha256 "4fdf45059124a22de5ec3680343b4cc81ebd91d4c315a71282c2c38472f0a09b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-69d4376/threedoors-a-linux-amd64"
    sha256 "b48e2fc4f329663b6c8308c888e4ec6f90719e333954326be34917aecd1d9d46"
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
