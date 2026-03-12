class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.032719.c542062"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-032719-c542062/threedoors-a-darwin-arm64"
    sha256 "34f16b9a373ac00bc4c39e8d1a0a939782f35a1387c02c2deb36b0946cf2dd94"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-032719-c542062/threedoors-a-darwin-amd64"
    sha256 "d4515e0be6b5fae9516d955d82781398e45cc9df95a03803a6b7cbbb0a84783b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-032719-c542062/threedoors-a-linux-amd64"
    sha256 "27e45fb3189737bc5b2db1d7b82e5c85b224a393b2d7fe597a10228f4d6e3c30"
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
