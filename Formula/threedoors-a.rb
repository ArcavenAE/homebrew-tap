class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.005946.3303fa9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-005946-3303fa9/threedoors-a-darwin-arm64"
    sha256 "ad9c24f9ec3acc8be14cef91a7caa49ad46d41481fee4e8ffd01004bab1dfb44"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-005946-3303fa9/threedoors-a-darwin-amd64"
    sha256 "5e6b9f2f40fe5f6af5072ea9cd25a51d93443a4852dc7925fbf9278b519c396c"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-005946-3303fa9/threedoors-a-linux-amd64"
    sha256 "77f8473d923ca01ed513d118deb689173609b1cfd1c27dd6f6fac86c05cd308a"
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
