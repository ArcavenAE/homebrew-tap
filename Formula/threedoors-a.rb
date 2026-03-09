class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.f189e90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-f189e90/threedoors-a-darwin-arm64"
    sha256 "2935bac1c0e823cfcb9941fe3d9f4c67e61bcc9f0d8b19f228e31f22c6cac5b0"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-f189e90/threedoors-a-darwin-amd64"
    sha256 "9fb51ba58eeb3631d052b444f235c8d64a2ca51561a980b22261de65a7d8b8d4"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-f189e90/threedoors-a-linux-amd64"
    sha256 "8c4ff8457c29c7060f15293051713bff0a19da72b28ab05863b45bd9a17bf5f1"
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
