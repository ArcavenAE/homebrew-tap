class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.b4ebb2c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-b4ebb2c/threedoors-a-darwin-arm64"
    sha256 "8eabfe4ed4211731f5a0cb08edd72723be37461e90cd2b383b1cd1a5e3318d51"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-b4ebb2c/threedoors-a-darwin-amd64"
    sha256 "c3cc70f46b8f9fa6c2fbdc9db7e8f8ef98b2c364b764fca8a24d2a11ace888c9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-b4ebb2c/threedoors-a-linux-amd64"
    sha256 "439eae11ccbc9992f3987c4d47ecc4964f594dbb90b2e817e3faa5549ebf4918"
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
