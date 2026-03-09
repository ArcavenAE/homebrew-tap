class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.30eb4f8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-30eb4f8/threedoors-a-darwin-arm64"
    sha256 "903995a52795e83d00bcfd7b53f4e27e5340526dd9bbe4037681b38330ddcf92"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-30eb4f8/threedoors-a-darwin-amd64"
    sha256 "ab278f55f866cd634441c016ce7194b5f91e2970fe1897c95eabceaeb57d634a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-30eb4f8/threedoors-a-linux-amd64"
    sha256 "5a524101dc7dec84f61dd5eb5097f6a5bdb79ddbb25c7720896284c88df234a6"
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
