class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.407a057"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-407a057/threedoors-a-darwin-arm64"
    sha256 "ee296f76456514823bd77c2cf0913da184045b7c7817fb32dff4b997485fa591"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-407a057/threedoors-a-darwin-amd64"
    sha256 "d44bfffc8e0347d2aa03ba03a15089d52916538f7bfa4beb48cec03d45c2dc30"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-407a057/threedoors-a-linux-amd64"
    sha256 "5bbb8b285bf59b56c874520d27694c8459d36d682aa37ba2d4173d7b78b3b2e8"
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
