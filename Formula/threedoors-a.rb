class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261109.231951.8cff5f9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-231951-8cff5f9/threedoors-a-darwin-arm64"
    sha256 "76d6c8ff4b3c269ff70e40b544f81204cf690a654d8c892bafe6a3b01fa4719a"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-231951-8cff5f9/threedoors-a-darwin-amd64"
    sha256 "12a29134be9170056c65b8d9d1034a8705eb4af2fd54c58aa06161d5f2202977"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-231951-8cff5f9/threedoors-a-linux-amd64"
    sha256 "ae48b0f069fc52862804e54a89989c2dd2cd3601db87b3f157df8eddb6feb98a"
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
