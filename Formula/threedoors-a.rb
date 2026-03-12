class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.182956.f4f5f0d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-182956-f4f5f0d/threedoors-a-darwin-arm64"
    sha256 "4ca92bfea01c3f480e16b1602475bfbf11221981d40911d8457275ed1cb1764e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-182956-f4f5f0d/threedoors-a-darwin-amd64"
    sha256 "841b0b05a0e9ff8d9ff50f8d72c66e097fca00b3f8d9c4c30c8a422634dec021"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-182956-f4f5f0d/threedoors-a-linux-amd64"
    sha256 "f95f1d92790ee20fe8250be08615cfbbd6070759ab9abb995e9931c31ed6ae81"
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
