class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.154609.aaeea7c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-154609-aaeea7c/threedoors-a-darwin-arm64"
    sha256 "5d9197c6bed30886632c2ddc3c5f814989e3c685eaf8345927c0e6f5855147e9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-154609-aaeea7c/threedoors-a-darwin-amd64"
    sha256 "8ca9b730312b5c31ad526044f7637bd6fff786cc092b2ffd441be749aeae6972"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-154609-aaeea7c/threedoors-a-linux-amd64"
    sha256 "0798b91f027950a24e0068ab93a5b21daaaaaeeadbcc027575d7e914ec3856f8"
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
