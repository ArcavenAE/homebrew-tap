class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d60bcb6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d60bcb6/threedoors-a-darwin-arm64"
    sha256 "abea787d29d0d1e553181bcf640cc6e30dbbee289caab30869e396c7f72466ba"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d60bcb6/threedoors-a-darwin-amd64"
    sha256 "405a6ea6406ff301998a4d732f72d0f697f2eb475beb6aa73be204f6d648761c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d60bcb6/threedoors-a-linux-amd64"
    sha256 "b889f85ecd9cf9a59eabb33c2a31f1a1b40f099fb4039c89f92e82e877ab7233"
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
