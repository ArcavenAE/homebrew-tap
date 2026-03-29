class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.234846.421e690"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-234846-421e690/threedoors-a-darwin-arm64"
    sha256 "6497371264489aafc3a9cb68547a1bda405efc4aad781fee132d727170e9b7b1"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-234846-421e690/threedoors-a-darwin-amd64"
    sha256 "e4452f608e46a9ce6701628529df8b125ff1e2739eeb9c315d912633699b07ff"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-234846-421e690/threedoors-a-linux-amd64"
    sha256 "11c2929fecfbb4b06892f9cd8a1a3b8f261a257aac1e079f7fc6de962b0caf11"
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
