class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.224750.49de8b8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224750-49de8b8/threedoors-a-darwin-arm64"
    sha256 "c0ec04a10d1972142e38ad0762dd140cb5b62ee0b036f18ae9234644e8d84216"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224750-49de8b8/threedoors-a-darwin-amd64"
    sha256 "fd09881e296becbe005ada8b1a41cda56a4ee8bcf817eee78706cbac3973541e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224750-49de8b8/threedoors-a-linux-amd64"
    sha256 "04fc58096867f410f90a543cee419e54aafff7bd12c9185545335300d620e6d4"
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
