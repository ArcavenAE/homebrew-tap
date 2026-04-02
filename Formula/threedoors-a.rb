class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260402.223751.3461c99"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-223751-3461c99/threedoors-a-darwin-arm64"
    sha256 "7c1e7132d7746e516ace416998821ac7d93357fb4c6ad9dec5bea45f266adca0"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-223751-3461c99/threedoors-a-darwin-amd64"
    sha256 "a118e5ad36429d26ae498f67cb2c678376eafdb4b6e2132d13ae29393267c857"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-223751-3461c99/threedoors-a-linux-amd64"
    sha256 "dd8d085ad63f6da979e01848cf686ec97ab366a112c632cef3a1248dd2c88f6f"
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
