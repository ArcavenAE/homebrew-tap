class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.210947.ab81dbb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-210947-ab81dbb/threedoors-a-darwin-arm64"
    sha256 "5aba522184ca9bfd5c98eed0d02c07d2b0b496047b17745df399e168c36770e7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-210947-ab81dbb/threedoors-a-darwin-amd64"
    sha256 "a2268d0c3b5cbf0a37e1df37a7a6558bcf19294d4477706b9c79e1b5c426b824"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-210947-ab81dbb/threedoors-a-linux-amd64"
    sha256 "4ae1c4f8f1795850c4957382b9a983787d0fe8f2f896752c5f73350108863a2a"
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
