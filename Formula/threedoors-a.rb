class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.205506.1ac5622"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205506-1ac5622/threedoors-a-darwin-arm64"
    sha256 "88ae71b11448d974e18c3ed02a3e11463be88a89df89908e68d6283ca79f133b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205506-1ac5622/threedoors-a-darwin-amd64"
    sha256 "0c949e039503b8b2ce0179ad02823607e9e5f68f25e447b58cc654c2092dac73"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205506-1ac5622/threedoors-a-linux-amd64"
    sha256 "bd9349a7badac1fbf3dc8a54e859e4d41fd10a43f7e0cc00c1ae80f7f0257d33"
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
