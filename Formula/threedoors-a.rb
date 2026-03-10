class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.b8a5797"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-b8a5797/threedoors-a-darwin-arm64"
    sha256 "f8a75ea147088aea4b431bc1f98d3987f9bc682b3384732580ee940fa5c2cb48"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-b8a5797/threedoors-a-darwin-amd64"
    sha256 "8d6eb57c799c768a5a445d61ebd00112125d991409520d5912e07e87f9cb38a7"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-b8a5797/threedoors-a-linux-amd64"
    sha256 "3bbb98ada89244ba42512c6401f82aa0ee3f0e605715093ac8fcad5179957819"
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
