class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.7c7dc08"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7c7dc08/threedoors-a-darwin-arm64"
    sha256 "c1537e8213777f4ce8d593284dcd1b88babe82a39e16dea5cfc697e4f8bc10fc"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7c7dc08/threedoors-a-darwin-amd64"
    sha256 "9d70b9f53f55c4e1f694d5744d7e75593848525dd93539596d0856b2099f0450"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7c7dc08/threedoors-a-linux-amd64"
    sha256 "f13f8318e5a595663ff4d3c99577d09519f6983270ca9175044d09c3f9c5da1b"
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
