class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.033312.7006cb0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033312-7006cb0/threedoors-a-darwin-arm64"
    sha256 "8a77634eff5687ca0b3fec246dbedbce059826de03fa12730cc451105800641a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033312-7006cb0/threedoors-a-darwin-amd64"
    sha256 "be64f8d167c7fec2e2d45fa8d7660865c54c4745ab407034a51fc1ed262e43a1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033312-7006cb0/threedoors-a-linux-amd64"
    sha256 "2561e2c07e72fb680385d79b7558b6df55031c49a849445d85c1a7d450807310"
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
