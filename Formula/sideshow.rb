class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261102.212216.a0d8974"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-212216-a0d8974/sideshow-darwin-arm64"
    sha256 "443a40dbab646580951cdb0df54a9f1479abd8a12fcac568f65588198d4cfd7a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-212216-a0d8974/sideshow-darwin-amd64"
    sha256 "7e9b23261cdbb74c115f5d95ecaa66606ed607e216114ed8d4745af9b8b163db"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-212216-a0d8974/sideshow-linux-amd64"
    sha256 "1c2c0b0f4d54e44b8b7a2299f11f1370b8591f0d8e752a8be7b971aecfe73993"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
