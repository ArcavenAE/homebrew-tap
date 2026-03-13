class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.232156.f5ab963"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-232156-f5ab963/threedoors-a-darwin-arm64"
    sha256 "564f1dba4cb9244881ecd937cefa0f2cd146692c176d0248254479e1123407fc"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-232156-f5ab963/threedoors-a-darwin-amd64"
    sha256 "335fc0cb7ffe7e63d6740e21af5d47e8ff6a4b2a1e2fc7b75a8c908d5e22cec5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-232156-f5ab963/threedoors-a-linux-amd64"
    sha256 "6de12f18cc3a77abced9e41f9fe12cdbad2ad9ab032f85bc90450f7a30766bc2"
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
