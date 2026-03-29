class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.231727.2c3ed67"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-231727-2c3ed67/threedoors-a-darwin-arm64"
    sha256 "b29dae7adc7782292d3af51c8cfd96f94d560ec658f4afde687bd35238e5d0b3"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-231727-2c3ed67/threedoors-a-darwin-amd64"
    sha256 "29cce53d6cf0dcae781ee3471f9de08bbc6fe65aaed3177a0c8ecfe9b6d4457a"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-231727-2c3ed67/threedoors-a-linux-amd64"
    sha256 "eeb1d02e4c3a2164d2ed42058571af2f43ef53697f88c6f5ccbbdea9824db368"
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
