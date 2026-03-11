class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.3191719"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3191719/threedoors-a-darwin-arm64"
    sha256 "3cae27386a3212ca8dac0f079018910ca3f5a9718d6a953e8ba3cdecfb5846c7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3191719/threedoors-a-darwin-amd64"
    sha256 "0419022882e56bac5f68f58c681ea5af349e8950a14c222a544c6f9e306305c6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3191719/threedoors-a-linux-amd64"
    sha256 "f082afad7ee73a2511f980178756f301179e57baf1897fbb04d954a59c5f5222"
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
