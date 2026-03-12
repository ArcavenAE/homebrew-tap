class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.193938.35f041a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-193938-35f041a/threedoors-a-darwin-arm64"
    sha256 "c728b4f2c210d7456e1ecfa11f0a2a1178bd9c27bdffdc3eea11c057da2aa393"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-193938-35f041a/threedoors-a-darwin-amd64"
    sha256 "03f11294aae34d37b6d3f0f4e67aa17a59476c899c3de0048254bd37638c68f6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-193938-35f041a/threedoors-a-linux-amd64"
    sha256 "b1164d26129f2cb36860ccab4eabaf4b28de85a6cbb8eb812a7bc422caf2067a"
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
